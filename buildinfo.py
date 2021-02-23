#!/usr/bin/python
# encoding: utf-8
# This file is based on installinstallmacos.py from 
# https://raw.githubusercontent.com/grahampugh/macadmin-scripts/master/installinstallmacos.py
# I needed only the Identification info
# Copyright 2017 Greg Neagle.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Thanks to Tim Sutton for ideas, suggestions, and sample code.
#
import subprocess


def get_current_build_info():
    '''Gets the local system build'''
    build_info = []
    sw_vers_cmd = ['/usr/bin/sw_vers']
    try:
        sw_vers_output = subprocess.check_output(sw_vers_cmd).splitlines()
        for line in sw_vers_output:
            line_decoded = line.decode('utf8')
            if 'ProductVersion' in line_decoded:
                build_info.insert(0, line_decoded.split("\t")[-1])
            if 'BuildVersion' in line_decoded:
                build_info.insert(1, line_decoded.split("\t")[-1])
    except subprocess.CalledProcessError as err:
        raise ReplicationError(err)
    return build_info

# show this Mac's info
build_info = get_current_build_info()
print('%-17s: %s' % ('OS Version', build_info[0]))
print('%-17s: %s\n' % ('Build ID', build_info[1]))
