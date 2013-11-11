package com.starkca.localphotos;

import android.app.Activity;
import android.util.Log;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.widget.Toast;

/**
 * Code obtained from
 * beshkiin.lv/android-swipe-gesture-implementation/
 */
public class SimpleGestureFilter extends SimpleOnGestureListener {
    public final static int SWIPE_UP = 1;
    public final static int SWIPE_DOWN = 2;
    public final static int SWIPE_LEFT = 3;
    public final static int SWIPE_RIGHT = 4;

    public final static int MODE_TRANSPARENT = 0;
    public final static int MODE_SOLID = 1;
    public final static int MODE_DYNAMIC = 2;

    private final static int ACTION_FAKE = -13;
    private int minSwipeDistance = 100;
    private int maxSwipeDistance = Integer.MAX_VALUE;
    private int minSwipeVelocity = 100;

    private int mode = MODE_DYNAMIC;
    private boolean running = true;
    private boolean tapIndicator = false;

    private Activity context;
    private GestureDetector detector;
    private SimpleGestureListener listener;

    public SimpleGestureFilter(Activity context, SimpleGestureListener sgl) {
        this.context = context;
        this.detector = new GestureDetector(context, this);
        this.listener = sgl;
    }

    public void onTouchEvent(MotionEvent event) {
        if(!running)
            return;

        boolean result = detector.onTouchEvent(event);
        if(mode == MODE_SOLID)
            event.setAction(MotionEvent.ACTION_CANCEL);
        else if(mode == MODE_DYNAMIC) {
            if(event.getAction() == ACTION_FAKE)
                event.setAction(MotionEvent.ACTION_UP);
            else if(result)
                event.setAction(MotionEvent.ACTION_CANCEL);
            else if(tapIndicator) {
                event.setAction(MotionEvent.ACTION_DOWN);
                tapIndicator = false;
            }
        }
    }

    public void setMode(int m) {
        mode = m;
    }

    public int getMode() {
        return mode;
    }

    public void setRunning(boolean status) {
        running = status;
    }

    public boolean getRunning() {
        return running;
    }

    public void setMaxSwipeDistance(int distance) {
        maxSwipeDistance = distance;
    }

    public int getMaxSwipeDistance() {
        return maxSwipeDistance;
    }

    public void setMinSwipeDistance(int distance) {
        minSwipeDistance = distance;
    }

    public int getMinSwipeDistance() {
        return minSwipeDistance;
    }

    public void setMinSwipeVelocity(int velocity) {
        minSwipeVelocity = velocity;
    }

    public int getMinSwipeVelocity() {
        return minSwipeVelocity;
    }

    @Override
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {

        final float xDistance = Math.abs(e1.getX() - e2.getX());
        final float yDistance = Math.abs(e1.getY() - e2.getY());
        boolean result = false;
        Log.i("GestureFilter", xDistance + "\r\n" + yDistance);

        if(!((xDistance > maxSwipeDistance) || (yDistance > maxSwipeDistance))) {
            velocityX = Math.abs(velocityX);
            velocityY = Math.abs(velocityY);

            Toast.makeText(context, "X: " + velocityX + "\r\nY: " + velocityY, Toast.LENGTH_LONG).show();

            if((velocityX > minSwipeVelocity) && (xDistance > minSwipeDistance)) {
                result = true;
                if(e1.getX() > e2.getX())
                    listener.onSwipe(SWIPE_LEFT);
                else
                    listener.onSwipe(SWIPE_RIGHT);
            }
            else if((velocityY > minSwipeVelocity) && (yDistance > minSwipeDistance)) {
                result = true;
                if(e1.getY() > e2.getY())
                    listener.onSwipe(SWIPE_UP);
                else
                    listener.onSwipe(SWIPE_DOWN);
            }
        }
        return result;
    }

    @Override
    public boolean onSingleTapUp(MotionEvent e) {
        tapIndicator = true;
        return false;
    }

    @Override
    public boolean onDoubleTap(MotionEvent arg0) {
        listener.onDoubleTap();
        return true;
    }

    @Override
    public boolean onDoubleTapEvent(MotionEvent arg0) {
        return true;
    }

    @Override
    public boolean onSingleTapConfirmed(MotionEvent arg0) {
        if(mode == MODE_DYNAMIC) {
            arg0.setAction(ACTION_FAKE);
            context.dispatchTouchEvent(arg0);
        }
        return false;
    }

    static interface SimpleGestureListener {
        void onSwipe(int direction);
        void onDoubleTap();
    }
}
