rule2 on AM2301#Humidity>60 do  IF Power != 1 Backlog power on; delay 2000; ENDIF endon

rule2 
   on Time#Minute|5 and AM2301#Humidity>65 do Backlog power on; delay 2000; endon
   on Time#Minute|5 and AM2301#Humidity<=65 do Backlog power off; delay 2000; endon
  
rule2 
   on AM2301#Humidity>65 do Backlog power on; delay 2000; endon
   on AM2301#Humidity<=65 do Backlog power off; delay 2000; endon


rule2 
   on Time#Minute|5  do if (AM2301#Humidity>65) Backlog power on; delay 2000; endif endon
   on Time#Minute|5  do if (AM2301#Humidity<=65) Backlog power off; delay 2000; endif endon

rule2 
   on Time#Minute|1  do IF (AM2301#Humidity>65) power on else power off endif endon
   on Time#Minute|5  do IF (AM2301#Humidity<=65) power off endif endon
   

   
rule2 
   ON Time#Minute|1 DO IF (AM2301#Humidity>65) power on ELSE power off ENDIF ENDON


rule2 
   on AM2301#Humidity do IF (%value% > 65) power on;delay 600 else power off;delay 600 endif endon

rule1 
   on Time#Minute|1  IF (%mem1% > 65) power on else power off endif

rule2 
   on AM2301#Humidity do mem1=%value% endon

rule1 
   on Time#Minute|1  do mem1=(AM2301#Humidity) endon

rule2 
   on Time#Minute|1  do IF (%mem1% > 65) power on else power off endif endon



rule1 
   on Time#Minute|5  do rule2 1 endon

rule2 
   on AM2301#Humidity do IF (%value% > 65) rule2 0; power on; delay 3000; rule2 0 else rule2 0; power off; delay 3000; rule2 0 endif endon



   
rule3 
   on AM2301#Humidity>60 do endon
   on AM2301#Humidity<=60 do endon
   
   Restart	1 = restart device with configuration saved to flash
2 = halt system (needs hardware reset or power cycle to restart)
99 = force restart device without configuration save


Enable a PIR Switch only at night~
Latitude and Longitude need to be set in config.

SwitchMode1 1
PowerOnState off


on Switch1#state=1 do Backlog Publish homeassistant/%topic%/PIR1 ON; RuleTimer1 30 endon on Rules#Timer=1 do Publish homeassistant/%topic%/PIR1 OFF endon

on Switch1#state do Backlog Publish homeassistant/%topic%/PIR1 %value%; RuleTimer1 30 endon on Rules#Timer=1 do Publish homeassistant/%topic%/PIR1 OFF endon


Rule1
  ON Switch1#state=1 DO Backlog event checksunrise=%time%; event checksunset=%time% ENDON
  ON event#checksunrise<%sunrise% DO backlog Power1 1; RuleTimer2 3000; Power1 1   ENDON
  ON event#checksunset>%sunset% DO backlog Power1 1; RuleTimer2 3000; Power1 1  ENDON
  ON Rules#Timer2=1 DO Power1 off ENDON
  
  Backlog ntpServer1 0.asia.pool.ntp.org; ntpServer2 192.168.0.39; ntpServer3 0.pool.ntp.org; timezone 1; restart 1
  
  
  FM3
  Rule1
  ON Switch1#state=1 DO backlog Power1 1; RuleTimer2 3000; Power1 1   ENDON
  ON Rules#Timer2=1 DO Power1 off ENDON
  
FM3 

Rule1 ON Switch1#state=1 DO backlog Power1 1; Publish homeassistant/%topic%/PIR2 ON; RuleTimer2 240 ENDON ON Rules#Timer=2 DO backlog Power1 off; Publish homeassistant/%topic%/PIR2 OFF ENDON

Rule2 ON %UPTIME%>3 DO restart 1 ENDON
Rule3 
	on Switch1#state=1 do Backlog Publish homeassistant/%topic%/PIR2 ON; RuleTimer1 30 endon 
	on Rules#Timer=1 do Publish homeassistant/%topic%/PIR2 OFF endon

  
Rule2 ON System#Boot DO Backlog RuleTimer3 3000; ENDON    ON Rules#Timer=3 DO restart 1 ENDON
Rule2 1
Restart 1
 
 rule3 on system#boot do publish2 homeassistant/binary_sensor/%macaddr%_motion/config {"name":"Motion Sensor","state_topic":"stat/%topic%/MOTION","device_class":"motion","force_update":true,"off_delay":300,"availability_topic":"tele/%topic%/LWT","payload_available":"Online","payload_not_available":"Offline","unique_id":"%macaddr%_motion","device":{"connections":[["mac","%macaddr%"]]}} endon
 
 
PG
Rule1 
	ON Switch1#state=1 DO Backlog event checksunrise=%time%; event checksunset=%time%; Publish homeassistant/%topic%/PIR1 ON;RuleTimer1 30 ENDON   
	ON event#checksunrise<%sunrise% DO backlog Power1 1; RuleTimer2 300; Power1 1;Publish homeassistant/%topic%/PIR1 ON;   ENDON   
	ON event#checksunset>%sunset% DO backlog Power1 1; RuleTimer2 300; Power1 1;Publish homeassistant/%topic%/PIR1 ON;  ENDON   
	on Rules#Timer=1 do Publish homeassistant/%topic%/PIR1 OFF endon
	ON Rules#Timer=2 DO Power1 off;  Publish homeassistant/%topic%/PIR1 OFF ENDON
Rule1 ON Switch1#state=1 DO Backlog event checksunrise=%time%; event checksunset=%time%; Publish homeassistant/%topic%/PIR1 ON;RuleTimer1 30 ENDON ON event#checksunrise<%sunrise% DO backlog Power1 1; RuleTimer2 300; Power1 1;Publish homeassistant/%topic%/PIR1 ON; ENDON ON event#checksunset>%sunset% DO backlog Power1 1; RuleTimer2 300; Power1 1;Publish homeassistant/%topic%/PIR1 ON; ENDON on Rules#Timer=1 do Publish homeassistant/%topic%/PIR1 OFF endon ON Rules#Timer=2 DO Power1 off;  Publish homeassistant/%topic%/PIR1 OFF ENDON


Rule2 ON System#Boot DO Backlog RuleTimer3 3000; ENDON    ON Rules#Timer=3 DO restart 1 ENDON
	
Rule2 ON clock#Timer=1 DO Backlog restart 1 ENDON
Rule3 ON Switch1#state=1 do Backlog Publish homeassistant/%topic%/PIR1 ON; RuleTimer1 30 endon on Rules#Timer=1 do Publish homeassistant/%topic%/PIR1 OFF endon