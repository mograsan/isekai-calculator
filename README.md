# isekai_calculator

A new Flutter project for a calculator written in isekai-characters.


## How to build and install developed apps

- Build your app by the below command for Android.  

	```
	$ flutter build apk
	```

- If you want to release iOS app, convert 'apk' to 'ios'.

	```
	$ flutter build ios
	```

- Then you can conduct installation. If you only connect one smart phone to the PC and no emulator is running, use the following command.

	```
	$ flutter install
	```

- When using more than two devices, confirm information of them like:

	```
	$ flutter devices  

	2 connected devices:  
	SO 02J                    • QV7006HH0D    • android-arm64 • Android 8.0.0 (API 26). 
	Android SDK built for x86 • emulator-5554 • android-x86   • Android 7.0 (API 24) (emulator)
	```
	
- To install app toward the device whose id is QV7006HH0D, only an initial character should be 
specified as follows.

	```
	$ flutter install -d q
	```



## Reference
- [Environmental settings for MacOS (Qiita)](https://qiita.com/oekazuma/items/92e9bae4268fea107efa)
- [Flutter Icons class](https://api.flutter.dev/flutter/material/Icons-class.html)
- [Install built apps in your smart phone](https://note.com/nbht/n/nd4338701daa5)