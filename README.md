---
title: FoodMapper
emoji: 🖇️
colorFrom: green
colorTo: blue
sdk: docker
app_port: 7860
pinned: true
header: mini
models:
  - thenlper/gte-large
tags:
  - food-science
  - food-database
  - semantic-search
  - usda
  - nutrition
  - match-food-databases
  - python
  - shiny
license: cc0-1.0
---

# FoodMapper

A neural embedding-based tool for matching food descriptions across nutritional databases.

[![License: CC0](https://img.shields.io/badge/License-CC0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Shiny for Python](https://img.shields.io/badge/Shiny-for%20Python-blue)](https://shiny.posit.co/py/)

## Overview

FoodMapper is a research application developed at the USDA Agricultural Research Service that solves the problem of matching food items between databases that use different naming conventions. The tool uses semantic embeddings to understand the meaning behind food descriptions, enabling accurate matches even when exact text differs.

### **[Click Here to Try FoodMapper](https://huggingface.co/spaces/richtext/semantic-food-mapper)**

No installation required - the application is hosted and ready to use on Hugging Face Spaces.

## Research Context

This application was developed as part of research on automated dietary data mapping methods. The tool demonstrates the practical application of neural embedding models for food database harmonization.

**Research Paper**: [Title Placeholder - Publication Pending]  
**Authors**: Lemay DG, Strohmeier MP, Stoker RB, Larke JA, Wilson SMG

## Features

- **Semantic Matching**: Uses GTE-Large neural embeddings to match based on meaning
- **Batch Processing**: Handle thousands of items efficiently  
- **Interactive Visualizations**: 7 chart types for exploring match distributions
- **Text Cleaning**: Optional preprocessing with live preview
- **Data Export**: Download results as CSV with all original data preserved
- **API with CPU Fallback**: Uses API for fast processing, falls back to CPU if unavailable

## Performance

- Processes thousands of items per minute via API
- Automatic fallback to CPU processing if API unavailable (slower but functional)
- CPU mode suitable for smaller datasets or testing
- Concurrent batch processing for optimal throughput

## Installation

### Prerequisites

- Python 3.8 or higher
- 2GB RAM minimum (4GB recommended for CPU mode)

### Local Setup (GPU-Accelerated)

For local deployment, the application runs entirely on your hardware using the Hugging Face transformers library.

1. Clone the repository:
```bash
git clone https://github.com/RichardStoker-USDA/Food-Mapper.git
cd Food-Mapper
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Install PyTorch for your platform:

**For Mac (Apple Silicon with Metal Performance Shaders):**
```bash
pip install torch torchvision torchaudio
```

**For NVIDIA GPU (CUDA):**
```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

**For CPU only:**
```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
```

4. Configure for local processing:
```bash
export MODEL_FALLBACK_MODE="local"  # Force local GPU/CPU usage
```

5. Run the application:
```bash
shiny run app.py --port 8000
```

6. Open your browser to `http://localhost:8000`

**Performance Notes:**
- Apple Silicon Macs: Uses Metal Performance Shaders (MPS) for GPU acceleration
- NVIDIA GPUs: Uses CUDA for fastest processing
- CPU: Works on any system but slower for large datasets
- Cloud deployments with minimal CPU: Consider using the hosted version on HuggingFace Spaces

## Usage

### Quick Start

1. **Upload Data**: Two CSV files required
   - Input CSV: Items to match
   - Target CSV: Reference database

2. **Configure**: Select text columns from each file

3. **Set Threshold**: Adjust similarity threshold (default: 0.85)

4. **Run Matching**: Process and view results

5. **Export**: Download matched results as CSV

### Data Requirements

- CSV format with headers
- Text columns for matching
- UTF-8 encoding recommended

### Sample Data

No data of your own? Click "Or use sample data" in the sidebar to test the application with pre-loaded food datasets.

## Technical Details

### Architecture

- **Framework**: Shiny for Python
- **Embedding Model**: [thenlper/gte-large](https://huggingface.co/thenlper/gte-large)
- **Visualizations**: Plotly
- **Data Processing**: Pandas, NumPy

### Processing Pipeline

1. Load and validate CSV files
2. Apply optional text cleaning
3. Generate embeddings via API or CPU
4. Calculate cosine similarity scores
5. Apply threshold for match/no-match classification
6. Present results with interactive visualizations

### Processing Modes

**HuggingFace Spaces (Recommended):** Uses API for fast processing with automatic CPU fallback. No setup required.

**Local GPU Mode:** When running locally with `MODEL_FALLBACK_MODE="local"`, the application uses:
- Metal Performance Shaders (MPS) on Apple Silicon Macs
- CUDA on NVIDIA GPUs  
- CPU as fallback

This allows processing thousands of items using your local GPU, often faster than API for large batches.

**API Configuration:** To use a different embedding API (e.g., OpenAI):
1. Update the model name in `app.py` (line with `DEEPINFRA_MODEL`)
2. Set your API key as environment variable
3. The app uses OpenAI-compatible endpoints, so most APIs work with minimal changes

## Deployment

### Hugging Face Spaces (Primary Method)

The application is hosted on Hugging Face Spaces for immediate use without installation. This is the recommended method as it requires no setup and includes API access for fast processing.

### GitHub Actions

The repository includes automated deployment workflow:
- Push changes to GitHub
- Action automatically updates Hugging Face Space
- Space rebuilds and relaunches with new changes

## Development Team

**Principal Investigator**: Dr. Danielle G. Lemay  
**Developer**: Richard Stoker  
**Organization**: USDA Agricultural Research Service  
**Location**: Western Human Nutrition Research Center, Davis, CA

## Citation

If you use FoodMapper in your research, please cite:

[Citation placeholder - to be updated upon publication]

## License

This work is in the public domain in the United States because it is a work prepared by an officer or employee of the United States Government as part of that person's official duties. See [17 U.S.C. 105](https://www.copyright.gov/title17/92chap1.html#105).

Internationally, this work is released under [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/).

## Contact

Richard Stoker  
IT Specialist (Scientific)  
richard.stoker@usda.gov  
USDA ARS Western Human Nutrition Research Center

## Acknowledgments

This research was supported by USDA ARS project funding. The application uses the GTE-Large model developed by Alibaba DAMO Academy.