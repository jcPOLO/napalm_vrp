========================
NAPALM Huawei VRP Driver
======================== 



Minimum Requirements
========================  

- A Huawei S2700 to test with.
- Pip version >= 19 (support for poetry projects)

Quick start
======================== 

 pip install git+https://github.com/jcPOLO/napalm_vrp.git


<main.py> ::

  from napalm import get_network_driver
  import getpass
  
  hostname = input("device IP address: ")
  username = input("Username: ")
  password = getpass.getpass()
  driver = get_network_driver("vrp")
  
  device = driver(
    hostname=hostname,
    username=username,
    password=password,
    optional_args = {'port': 22}
    )
  
  device.open()
  facts = device.get_facts()
  print(facts)
  device.close()

Check the full https://napalm.readthedocs.io/en/latest/index.html for more detailed instructions.

Supported Getters
=================

- get_facts
- get_environment
- get_interfaces
- get_interfaces_ip
- get_config
- get_lldp_neighbors
- get_lldp_neighbors_detail
- get_vlans          

wip...