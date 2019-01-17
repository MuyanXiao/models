#!/bin/bash
# Copyright 2018 The TensorFlow Authors All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
#
# Script to preprocess the Mapillary/Custom dataset.
#
# Usage:
#   bash ./preprocess_custom.sh
#
# The folder structure is assumed to be:
#  + datasets
#    - build_custom_data.py
#    - convert_custom.sh
#    + custom
#      + image
#      + label
#

# Exit immediately if a command exits with a non-zero status.
set -e

CURRENT_DIR=$(pwd)
WORK_DIR="."

# Root path for Cityscapes dataset.
CUSTOM_ROOT="${WORK_DIR}/custom"

# Build TFRecords of the dataset.
# First, create output directory for storing TFRecords.
OUTPUT_DIR="${CUSTOM_ROOT}/tfrecord"
mkdir -p "${OUTPUT_DIR}"

BUILD_SCRIPT="${CURRENT_DIR}/build_custom_data.py"

echo "Converting custom dataset..."
python "${BUILD_SCRIPT}" \
  --custom_root="${CUSTOM_ROOT}" \
  --output_dir="${OUTPUT_DIR}" \
