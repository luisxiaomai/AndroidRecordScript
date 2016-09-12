#!/bin/bash  
deviceSerial=$1
packageInfo='sap.sfa.container'
launchTimeout=600
ubuntunVideoPath="/home/sapanywhere/Desktop/androidVideo"$deviceSerial
deviceVideoPath=/sdcard/uiTAVideo
if [ ! -x "$ubuntunVideoPath" ]; then
  mkdir "$ubuntunVideoPath"  
fi 
cd $ubuntunVideoPath
if [ -f "v1.mp4" ]; then
  rm -r *.mp4  
fi
deviceVideoFileExistingInfo=$(adb -s $deviceSerial shell ls $deviceVideoPath/v1.mp4)
if [[ $deviceVideoFileExistingInfo != *"No such"* ]] ; then
  adb -s $deviceSerial shell rm -r $deviceVideoPath
fi
deviceVideoFolderExistingInfo=$(adb -s $deviceSerial shell ls $deviceVideoPath)
if [[ $deviceVideoFolderExistingInfo == *"No such"* ]] ; then
  adb -s $deviceSerial shell  mkdir $deviceVideoPath
fi
echo "Wait for sap anywhere app launch."
for ((idx=0;idx<=$launchTimeout;idx++))
do
  anywhereProcessString=$(adb -s $deviceSerial shell ps | grep $packageInfo) 
  if [ "${anywhereProcessString/$packageInfo}" != "$anywhereProcessString" ] ; then
    echo "SAP Anywhere OCC app was launched"
    break
  elif [ $idx -eq $launchTimeout ] ; then
    echo "SAP Anywhere app was not launched in $launchTimeout seconds"
    break
  else
    sleep 1
  fi
done
echo "Start to record android UI TA video."
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v1.mp4
echo "Finish 1 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v2.mp4
echo "Finish 2 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v3.mp4
echo "Finish 3 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v4.mp4
echo "Finish 4 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v5.mp4
echo "Finish 5 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v6.mp4
echo "Finish 6 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v7.mp4
echo "Finish 7 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v8.mp4
echo "Finish 8 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v9.mp4
echo "Finish 9 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v10.mp4
echo "Finish 10 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v11.mp4
echo "Finish 11 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v12.mp4
echo "Finish 12 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v13.mp4
echo "Finish 13 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v14.mp4
echo "Finish 14 video"
adb -s $deviceSerial shell screenrecord --size 480x720  --bit-rate 2000000 $deviceVideoPath/v15.mp4
echo "Finish 5 video"




