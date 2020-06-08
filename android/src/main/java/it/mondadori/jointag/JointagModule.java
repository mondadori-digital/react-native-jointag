package it.mondadori.jointag;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.jointag.proximity.ProximitySDK;

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
    public void setConsent(int forVendor, Boolean value) {
        ProximitySDK.getInstance().setGDPRConsent(forVendor, value);
    }
}
