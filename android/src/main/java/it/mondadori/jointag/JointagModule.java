package it.mondadori.jointag;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.jointag.proximity.ProximitySDK;
import com.jointag.proximity.cmp.ManualConsent;

import android.content.Context;
import android.util.Log;

import java.util.Map;
import java.util.HashMap;

public class JointagModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    // private static final String MANUAL_CONSENT_PROFILING = ManualConsent.Profiling;
    // private static final String MANUAL_CONSENT_MONITORING = ManualConsent.Monitoring;
    // private static final String MANUAL_CONSENT_ADVERTISING = ManualConsent.Advertising;

    public JointagModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "Jointag";
    }

    @Override
    public Map<String, Object> getConstants() {
        final Map<String, Object> constants = new HashMap<>();
        constants.put("MANUAL_CONSENT_PROFILING", ManualConsent.Profiling.toString());
        constants.put("MANUAL_CONSENT_MONITORING", ManualConsent.Monitoring.toString());
        constants.put("MANUAL_CONSENT_ADVERTISING", ManualConsent.Advertising.toString());
        return constants;
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
    public void setManualConsent(String type, Boolean value) {
        Log.d("JointagModule ", "type: " + type);
        ProximitySDK.getInstance().setManualConsent(ManualConsent.valueOf(type), value);
    }
}
