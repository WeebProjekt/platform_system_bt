/*
 * Copyright 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.IBluetoothHidDeviceCallback;
import android.bluetooth.BluetoothHidDeviceAppSdpSettings;
import android.bluetooth.BluetoothHidDeviceAppQosSettings;

/** @hide */
interface IBluetoothHidDevice {
    boolean registerApp(in BluetoothHidDeviceAppSdpSettings sdp,
            in BluetoothHidDeviceAppQosSettings inQos, in BluetoothHidDeviceAppQosSettings outQos,
            in IBluetoothHidDeviceCallback callback);
    boolean unregisterApp();
    boolean sendReport(in BluetoothDevice device, in int id, in byte[] data);
    boolean replyReport(in BluetoothDevice device, in byte type, in byte id, in byte[] data);
    boolean reportError(in BluetoothDevice device, byte error);
    boolean unplug(in BluetoothDevice device);
    boolean connect(in BluetoothDevice device);
    boolean disconnect(in BluetoothDevice device);
    List<BluetoothDevice> getConnectedDevices();
    List<BluetoothDevice> getDevicesMatchingConnectionStates(in int[] states);
    int getConnectionState(in BluetoothDevice device);
    String getUserAppName();
    boolean setConnectionPolicy(in BluetoothDevice device, int connectionPolicy);
}
