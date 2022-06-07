# PurpleSenser

This package provides the interface to a purple air sensors (the new one as of 2022) from Swift and ObjC returning the name of the sensor, humidity, temperature, pressure, and the air quality index ( current value and several types of running averages).



These values can be obtained from purple air map, where you context click on the sensor, scroll to the button of the pop-up where it says "Get This Widget". Clicking on this gives another pop-up menu where you can click JSON which shows the fields.

For example "79963" is the device ID of the saratoga swim club's sensor, and "PLAU2B5XC0FSICZR" is the thinkspeak primary id read key. These can be modified for the particular sensor you want to use.

The interface is pretty easy to use, in that you conform to the protocol, and call the performRequest(id: String, thinkspeakKey: String).

When the update is finished the protocol method didUpdatePurple(_ purple: PurpleModel), or func didFailWithError(_ error: Error)

are called. The data is returned in an object of PurpleModel which has properties for each of the sensor values.

The library can be used by swift programs or objective-c programs.
