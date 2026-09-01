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

#endif
