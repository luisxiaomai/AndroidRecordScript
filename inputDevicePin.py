#coding=utf-8
import argparse
import os
from uiautomator import Device
from time import sleep

def define_commandline_parameters():
	parser = argparse.ArgumentParser(description='Enter device pin code')
	parser.add_argument('--deviceSerial', help='give unique device serial)')
	args = parser.parse_args()
	return args

def inputPinCode(deviceSerial):
	d = Device(deviceSerial)
	if deviceSerial=="d2a64bbf":
	    d(text="1").click()	
    else:
        d(textContains="1").click()
	sleep(1)
	d(textContains="2").click()
	sleep(1)
	d(textContains="3").click()
	sleep(1)
	d(textContains="4").click()
	sleep(1)	
	d(resourceId="com.android.keyguard:id/key_enter").click()
	sleep(2)

if __name__ == "__main__":  
	args=define_commandline_parameters()
	inputPinCode(args.deviceSerial)
