#ifndef GX_STUB_H
#define GX_STUB_H

int GXOpenDisplay(void *hwnd, unsigned int flags);
int GXCloseDisplay(void);
void *GXBeginDraw(void);
int GXEndDraw(void);
int GXOpenInput(void);
int GXCloseInput(void);
void *GXGetDefaultKeys(void *outBuffer);
void *GXGetDisplayProperties(void);
int GXSuspend(void);
int GXResume(void);

/* Saves the current window contents (post-rotation, what's actually on
   screen) as a BMP. Returns 1 on success, 0 on failure (no window yet, or
   the write failed). Meant for demomode's SCREENSHOT command -- lets
   scripted test runs (and Claude) capture what a screen looks like
   without a human manually taking one. */
int uw_save_screenshot(const char *path);

#endif
