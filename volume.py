# coding: utf-8

import dialogs
import json
import ui
import os

directory = os.path.expanduser('~/Documents/pythonista-stash-home')
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
settings_file_path = os.path.join(directory, settings_file_name)
print("settings_file_path %s" % (settings_file_path))
try:
    settings_dict = None
    try: 
        with open(settings_file_path) as in_file:
            settings_dict = json.load(in_file)  # your data has been read in from file into a new dict
            print(settings_dict)
    except IOError:
        print("No settings found")
        settings_dict = { 'local': {} }
        

    
    name = None
        
    local = settings_dict['local']

    if 'ios_device_name' in local:
        name = local['ios_device_name']
    else:
        name = dialogs.text_dialog(title='name this device', text='').lower()
        local['ios_device_name'] = name

    items = [
        { 'title': 'name' },
        { 'title': 'address' },
        ]
    dialogs.edit_list_dialog(title='remote machines', items=items, move=True, delete=True)
    
    print name
    
    #os.path.isfile(path)    
    print(settings_dict)

    _stash('ls')
finally:
    print("all done, writing out settings")
    with open(settings_file_path, 'w') as out_file:
        json.dump(settings_dict, out_file)
