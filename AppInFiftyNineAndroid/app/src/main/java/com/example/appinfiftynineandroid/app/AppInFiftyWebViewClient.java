package com.example.appinfiftynineandroid.app;

import android.webkit.WebView;
import android.webkit.WebViewClient;

/**
 * AppInFiftyWebViewClient subclass loads all hyperlinks in the existing WebView
 */
public class AppInFiftyWebViewClient extends WebViewClient {
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        // When user clicks a hyperlink, load in the existing WebView
        view.loadUrl(url);
        return true;
    }
}
