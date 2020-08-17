Kiosk Mode Instruction

Kiosk mode (lock mode) is a special application mode. You cannot exit these applications.

The purpose of this template is:
•	Demonstration of launching applications in Kiosk Mode;
•	Make a simple, understandable mechanism for implementing the operation of the mode in any application.
The all implementation of the mode is in the KioskApplication.pas module:
•	StartLockTask (AOtherAppPackages: TArrayOfStrings = []) - starts Kiosk Mode. AOtherAppPackages - accepts an array of strings, package names of external applications to that need access from your application.
Example: StartLockTask (['com.android.settings']);
•	StopLockTask - turns off Kiosk Mode;
•	CleanOwnerState - Clears the status of the application as the current owner of the device.

Create an instance of the TKioskApplication class and call StartLockTask after the application starts. It is also necessary to make a condition for exiting the application (for example, entering a password). Before closing the application, call StopLockTask.

To run Kiosk Mode on the device, you will need to make your application the owner of the device. To perform this procedure, you need to perform a number of actions:
1.	Your device should not have a single account. Go to “Settings -> Accounts and sync” and delete all accounts;
2.	Add AdminReceiver_classes.jar library to the Libraries section;
3.	Modify AndroidManifest.template.xml;

<receiver
android:name="com.kiosk.admin.AdminReceiver"
android:permission="android.permission.BIND_DEVICE_ADMIN">
			<meta-data
			android:name="android.app.device_admin"
			android:resource="@xml/device_owner_receiver"/>
<intent-filter>			
<action android:name="android.app.action.DEVICE_ADMIN_ENABLED" />
<action android:name="android.app.action.PROFILE_PROVISIONING_COMPLETE"/>
</intent-filter>
</receiver>

4.	Add the following permissions:
-	Broadcast Sticky ;
-	Expand Status Bar;
-	Receive Boot Complete;
-	Get Accounts;
-	Bind Device Admin.

5.	Connect the device to the computer, compile and install the application on the device;

6.	Go to the commands folder, open SetOwner.bat in edit mode. On the 7th line, check the path to your adb.exe on the computer and replace "com.mycompany.kioskapp" with the package name of your application;

7.	Make sure the device is connected to the computer and run SetOwner.bat.
After these steps, your application will become the owner of the device and will be able to fully work in Kiosk Mode. Also, after these procedures it will not be possible to uninstall the application just like that. To remove the application, you must remove the status of the owner of the device. To do this, your application must call the CleanOwnerState method. After that, you can uninstall the application. To return the status of the owner back - run SetOwner.bat again.


