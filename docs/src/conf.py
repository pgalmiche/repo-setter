# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.

from os.path import abspath
import sys

sys.path.insert(0, abspath("../../demos/python"))

# -- Project information -----------------------------------------------------

project = "repo-setter"
copyright = "Pierre Galmiche, 2024"
author = "Pierre Galmiche"

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    "sphinx.ext.duration",
    "sphinx.ext.autodoc",
    "sphinx.ext.intersphinx",
    "sphinx.ext.autosummary",
    "sphinx.ext.viewcode",
    "sphinx.ext.extlinks",
    "sphinx_tabs.tabs",
]

intersphinx_mapping = {
    "python": ("https://docs.python.org/3/", None),
    "sphinx": ("https://www.sphinx-doc.org/en/master/", None),
}

# Add any paths that contain templates here, relative to this directory.
# templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = "sphinx_rtd_theme"

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ["_static"]
html_css_files = ["theme.css"]
master_doc = "index"

extlinks = {
    "K3D": ("http://www.k3d-jupyter.org/%s", "%s"),
    "Numpy": ("https://numpy.org/%s", "%s"),
    "Vedo": ("https://vedo.embl.es/%s", "%s"),
    "Colour": ("https://github.com/vaab/colour/%s", "%s"),
    "SimExporter": ("https://github.com/RobinEnjalbert/SimExporter/%s", "%s"),
    "Docker": ("https://www.docker.com/%s", "%s"),
}

autodoc_mock_imports = ["vtk", "vedo"]
