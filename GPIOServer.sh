# Script originally created by Daniel Curzon (http://www.instructables.com/member/drcurzon)
# Edited by Ardya Dipta to control the mobile robot using RaspPi Robot Board by adding GPIO pin 7 and 8, 
# and edited pin 17 to instruct the robot to move forward
# more details visit http://ardyadipta.com/?p=425
# Initial version created 10th June 2012
# Version: 1.0

###################################
#####  EDIT THESE BEFORE USE  #####
###################################
mysqlusername="gpio"
mysqlpassword="raspberry"

#############################################################################################################################
################################################### DO NOT EDIT BELOW THIS LINE ##############################################
##############################################################################################################################

#Set  Refresh
echo "How long do you want the wait time to be?          "
read waitTime

#Invoke GPIO
echo "4" > /sys/class/gpio/export
echo "7" > /sys/class/gpio/export
echo "8" > /sys/class/gpio/export
echo "17" > /sys/class/gpio/export
echo "18" > /sys/class/gpio/export
echo "21" > /sys/class/gpio/export
echo "22" > /sys/class/gpio/export
echo "23" > /sys/class/gpio/export
echo "24" > /sys/class/gpio/export
echo "25" > /sys/class/gpio/export

#Start Loop
while :
do
#Read MySQL Data
#Direction
direction4=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='4'";)
direction7=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='7'";)
direction8=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='8'";)
direction17=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='17'";)
direction18=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='18'";)
direction21=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='21'";)
direction22=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='22'";)
direction23=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='23'";)
direction24=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='24'";)
direction25=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinDirection FROM pinDirection WHERE pinNumber='25'";)
#Status
status4=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='4'";)
status7=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='7'";)
status8=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='8'";)
status17=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='17'";)
status18=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='18'";)
status21=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='21'";)
status22=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='22'";)
status23=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='23'";)
status24=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='24'";)
status25=$(mysql -B --disable-column-names --user=$mysqlusername --password=$mysqlpassword gpio -e "SELECT pinStatus FROM pinStatus WHERE pinNumber='25'";)

#Run Commands
if [ "$direction4" == "out" ]; then
	echo "out" > /sys/class/gpio/gpio4/direction
	if [ "$status4" == "1" ]; then
		echo "1" > /sys/class/gpio/gpio4/value
		echo "GPIO 4 Turned On"
	else
		echo "0" > /sys/class/gpio/gpio4/value
		echo "GPIO 4 Turned Off"
	fi
else
	echo "in" > /sys/class/gpio/gpio4/direction
fi
if [ "$direction7" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio7/direction
        if [ "$status7" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio7/value
                echo "GPIO 7 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio7/value
                echo "GPIO 7 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio7/direction
fi

if [ "$direction8" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio8/direction
        if [ "$status8" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio8/value
                echo "GPIO 8 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio8/value
                echo "GPIO 8 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio8/direction
fi
if [ "$direction17" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio17/direction
	if [ "$status17" == "1" ]; then
                # echo "1" > /sys/class/gpio/gpio17/value
                # echo "GPIO 17 Turned On"
                python forward.py
                echo "Robot moves forward"
        else
                echo "0" > /sys/class/gpio/gpio17/value
                echo "GPIO 17 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio17/direction
fi

if [ "$direction18" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio18/direction
	if [ "$status18" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio18/value
                echo "GPIO 18 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio18/value
                echo "GPIO 18 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio18/direction
fi
if [ "$direction21" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio21/direction
	if [ "$status21" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio21/value
                echo "GPIO 21 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio21/value
                echo "GPIO 21 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio21/direction
fi
if [ "$direction22" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio22/direction
	if [ "$status22" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio22/value
                echo "GPIO 22 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio22/value
                echo "GPIO 22 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio22/direction
fi
if [ "$direction23" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio23/direction
	if [ "$status23" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio23/value
                echo "GPIO 23 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio23/value
                echo "GPIO 23 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio23/direction
fi
if [ "$direction24" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio24/direction
	if [ "$status24" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio24/value
                echo "GPIO 24 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio24/value
                echo "GPIO 24 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio24/direction
fi
if [ "$direction25" == "out" ]; then
        echo "out" > /sys/class/gpio/gpio25/direction
	if [ "$status25" == "1" ]; then
                echo "1" > /sys/class/gpio/gpio25/value
                echo "GPIO 25 Turned On"
        else
                echo "0" > /sys/class/gpio/gpio25/value
                echo "GPIO 25 Turned Off"
        fi
else
        echo "in" > /sys/class/gpio/gpio25/direction
fi
#Complete Loop
sleep $waitTime
done
