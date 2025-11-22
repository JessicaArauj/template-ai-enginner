"""Streamlit dashboard to visualize the latest test/metrics output."""

from __future__ import annotations

import json
import sys
from pathlib import Path

import pandas as pd
import streamlit as st

ROOT_DIR = Path(__file__).resolve().parents[1]
if str(ROOT_DIR) not in sys.path:
    sys.path.insert(0, str(ROOT_DIR))

from script.python.config import METRICS_FILE


st.set_page_config(
    page_title='Test Metrics Dashboard',
    layout='wide',
    initial_sidebar_state='expanded',
)
st.title('Test Metrics Overview')
st.caption(
    'Visual summary of the most recent pipeline run. '
    'Execute `python -m script.python.aut` before refreshing this page.'
)


def load_metrics(path: Path) -> dict | None:
    if not path.exists():
        st.warning(
            f'No metrics file found at "{path}". '
            'Run the pipeline to generate test statistics.'
        )
        return None
    raw = path.read_bytes()
    for encoding in ('utf-8', 'utf-8-sig', 'latin-1'):
        try:
            return json.loads(raw.decode(encoding))
        except UnicodeDecodeError:
            continue
        except json.JSONDecodeError as exc:  # pragma: no cover - defensive
            st.error(f'Failed to parse metrics JSON: {exc}')
            return None
    st.error('Failed to decode metrics file; unsupported encoding.')
    return None


metrics = load_metrics(METRICS_FILE)
if not metrics:
    st.stop()

backend = metrics.get('backend', 'N/A').upper()
left, mid, right = st.columns(3)
left.metric('Backend', backend)
mid.metric('Label Column', metrics.get('label_column', '-'))
right.metric('Test Size', metrics.get('test_size', '-'))

st.markdown('---')
st.subheader('Run Metadata')
meta_cols = st.columns(3)
meta_cols[0].write(metrics.get('text_columns', []))
meta_cols[0].caption('Text columns used for modeling')

meta_cols[1].json(
    {
        key: value
        for key, value in metrics.items()
        if key
        in {
            'bert_model',
            'llm_model',
            'hf_space',
            'hf_api_name',
            'local_model',
            'best_model',
        }
    }
)
meta_cols[1].caption('Model-specific identifiers')

meta_cols[2].json(
    {
        key: value
        for key, value in metrics.items()
        if key
        in {
            'records_classified',
            'vectorizer_scores',
        }
    }
)
meta_cols[2].caption('Key counters and scores')

st.markdown('---')
if 'vectorizer_scores' in metrics:
    st.subheader('Vectorizer Accuracy')
    scores = (
        pd.Series(metrics['vectorizer_scores'], name='accuracy')
        .rename_axis('model')
        .reset_index()
    )
    scores['accuracy'] = scores['accuracy'].astype(float)
    st.bar_chart(
        data=scores,
        x='model',
        y='accuracy',
    )

classification_report = metrics.get('classification_reports')
st.subheader('Classification Report')
if isinstance(classification_report, dict):
    st.json(classification_report)
elif classification_report:
    st.code(classification_report)
else:
    st.info('No classification report was captured for this run.')

feature_importance = metrics.get('feature_importance')
st.subheader('Feature Importance')
if isinstance(feature_importance, dict) and feature_importance:
    tabs = st.tabs(list(feature_importance.keys()))
    for tab, (label, items) in zip(tabs, feature_importance.items(), strict=False):
        df = pd.DataFrame(items, columns=['term', 'weight'])
        tab.table(df)
else:
    st.info('Feature importance data is unavailable for this run.')

st.markdown('---')
st.caption(f'Data source: {METRICS_FILE}')
