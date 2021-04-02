package it.mondadori.jointag;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.jointag.proximity.ProximitySDK;

import androidx.preference.PreferenceManager;
import android.content.SharedPreferences;
import android.content.Context;
import android.util.Log;

public class JointagModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public JointagModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "Jointag";
    }

    @ReactMethod
    public void getInstallationId(Promise promise) {
        try {
            String installationId = ProximitySDK.getInstance().getInstallationId();
            promise.resolve(installationId);
        } catch(Exception e) {
            promise.reject("Jointag getInstallationId Error", e);
        }
    }

    @ReactMethod
    public void getAdvertisingId(Promise promise) {
        try {
            String advId = ProximitySDK.getInstance().getAdvertisingIdentifier();
            promise.resolve(advId);
        } catch(Exception e) {
            promise.reject("Jointag getAdvertisingId Error", e);
        }
    }

    @ReactMethod
    public void checkPendingPermissions() {
        ProximitySDK.getInstance().checkPendingPermissions();
    }

    @ReactMethod
    public void setConsent(Boolean value) {
        SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(this.reactContext);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString("IABTCF_PublisherCustomPurposesConsents", value ? "1" : "0");
        editor.apply();
    }
}
