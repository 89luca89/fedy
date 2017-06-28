#!/bin/bash

dnf copr -y disable heikoada/gradio
dnf -y --setopt clean_requirements_on_remove=1 erase gradio -y
