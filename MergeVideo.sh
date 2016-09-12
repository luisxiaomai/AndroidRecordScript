#!/bin/bash  
deviceSerial=$1
ubuntunVideoPath="/home/sapanywhere/Desktop/androidVideo"$deviceSerial
deviceVideoPath=/sdcard/uiTAVideo
cd $ubuntunVideoPath
echo "Finish android UI TA video recording"
echo "Start to merge all videos to a single video"
sleep 2
adb -s $deviceSerial pull $deviceVideoPath
sleep 10
for ext in mp4; do 
  files=( *."$ext" )
  echo "There are ${#files[@]} videos generated"
done
for f in "${files[@]}"; do
  var=$var' -cat '$f
done 
MP4Box$var -new AndroidUITAVideo.mp4
echo "Finish merge all videos to a single video"
