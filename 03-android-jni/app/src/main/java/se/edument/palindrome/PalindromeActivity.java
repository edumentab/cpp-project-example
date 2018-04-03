package se.edument.palindrome;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.KeyListener;
import android.view.KeyEvent;
import android.view.View;
import android.widget.TextView;

import static android.text.InputType.TYPE_CLASS_TEXT;

public class PalindromeActivity extends AppCompatActivity {

    // Used to load the 'native-lib' library on application startup.
    static {
        System.loadLibrary("Palindrome_jni");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_palindrome);

        TextView editText = findViewById(R.id.edit_text);
        final TextView palindromeStatus = findViewById(R.id.palindrome_status);

        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void afterTextChanged(Editable s) {
                if (s.length() == 0) {
                    palindromeStatus.setText("");
                }
                else {
                    palindromeStatus.setText(isPalindrome(s.toString())
                            ? "is a palindrome" : "is not a palindrome");
                }
            }

            @Override
            public void beforeTextChanged(CharSequence s, int start,
                                          int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start,
                                      int before, int count) {
            }
        });
    }

    /**
     * Check if a string is a palindrome using our native library
     */
    public static native boolean isPalindrome(String str);
}
