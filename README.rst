  
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
