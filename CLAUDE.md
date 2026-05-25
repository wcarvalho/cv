# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an academic CV generator that converts YAML data files into LaTeX and Markdown formatted CVs. The system uses Jinja2 templates to render content from structured YAML files containing academic information like publications, employment, education, etc.

## Architecture

- **Data Layer**: YAML files in `yaml/` directory contain structured CV content (employment, education, publications, etc.)
- **Template Engine**: `generate.py` processes YAML data through Jinja2 templates
- **Templates**: Two output formats supported via templates in `templates/latex/` and `templates/markdown/`
- **Build System**: Makefile orchestrates the build process, creating output in `build/` directory

## Key Files

- `generate.py`: Main Python script that processes YAML files through Jinja2 templates
- `cv_academic.yaml`: Primary configuration file defining section order and basic content
- `yaml/*.yaml`: Individual YAML files for each CV section (employment, education, publications, etc.)
- `templates/latex/cv.tex`: LaTeX template for PDF generation
- `templates/markdown/cv.md`: Markdown template for web/HTML output
- `Makefile`: Build automation with targets for PDF, Markdown, staging, and publishing

## Development Setup

1. Create conda environment: `./setup.sh`
2. Activate environment: `conda activate cv`
3. Install dependencies: `pip install -r requirements.txt`

## Common Commands

### Building
- `make all`: Generate both PDF and Markdown versions
- `make build/cv.pdf`: Generate PDF only
- `make build/cv.md`: Generate Markdown only
- `make clean`: Remove build artifacts

### Development
- `make viewpdf`: Build PDF and open it
- `./make.sh`: Quick build and stage to website (activates conda env automatically)

### Publishing
- `make stage`: Copy built files to website directory
- `make jekyll`: Stage files and start Jekyll server
- `make push`: Stage files and push to website repository

### Testing Changes
- `ipython generate.py -- yaml/*.yaml cv_academic.yaml --latex --preview`: Preview LaTeX output without writing files
- `ipython generate.py -- yaml/*.yaml cv_academic.yaml --markdown --preview`: Preview Markdown output

## Data Structure

The CV content is modularized across YAML files:
- Each section (employment, education, etc.) has its own YAML file in `yaml/`
- `cv_academic.yaml` defines the section order and basic configuration
- YAML files use consistent structure with items containing dates, titles, descriptions, etc.

## Template System

- LaTeX templates use custom Jinja2 delimiters: `~< >~` for blocks, `<< >>` for variables
- Markdown templates use standard Jinja2 delimiters
- Section templates in `templates/{latex,markdown}/sections/` handle specific CV sections
- The system supports conditional rendering and formatting specific to each output format

## LaTeX Dependencies

PDF generation requires:
- LaTeX distribution with `latexmk`
- `biber` for bibliography processing (note: MacOS-specific hack in Makefile line 38)