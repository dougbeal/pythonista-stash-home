# coding: utf-8

import dialogs
import json
import ui
import os

directory = '~/Documents/pythonista-stash-home'
settings_file_name = 'settings_dict.json'

settings_dict = {
    'remote_machines' : {
        'machine_name_a'    : {
            'username': 'auser',
            'address': 'ipaddress.0.0.1'
        }
    },
    'local': {
        'ios_device_name' : 'my_iphone_x'
        }
}


# print(settings_dict)

# with open(file_name, 'w') as out_file:
#     json.dump(settings_dict, out_file)   # your data has now been written to a file in the iOS file system
    
# open up 'settings_dict.json' in Pythonist to see your data
# turn off, reboot, etc. your iOS device
# several minutes, hours, days, months later, you can run:

try: 
    with open(os.path.join(directory, settings_file_name)) as in_file:
        settings_dict = json.load(in_file)  # your data has been read in from file into a new dict
except IOError:
    settings_dict = None


name = None

if settings_dict and settings_dict['local'] and settings_dict['local']['ios_device_name']:
    name = settings_dict['local']['ios_device_name']
else:
    name = dialogs.text_dialog(title='name this device', text='')

print name
    
#os.path.isfile(path)    
print(new_dict)

_stash('ls')
