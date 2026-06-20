#include <windows.h>

struct TargetProcess {
    DWORD pid;
    HWND window;
};

BOOL CALLBACK EnumThreadWndProc(HWND hwnd, LPARAM lParam) {
    TargetProcess* target = (TargetProcess*)lParam;
    DWORD wmProcessId;

    GetWindowThreadProcessId(hwnd, &wmProcessId);

    if (wmProcessId == target->pid && IsWindowVisible(hwnd)) {
        target->window = hwnd;
        return FALSE;
    }
    return TRUE;
}

extern "C" __declspec(dllexport) LONG Maximize(LONG param) {
    TargetProcess target = { GetCurrentProcessId(), NULL };

    EnumWindows(EnumThreadWndProc, (LPARAM)&target);

    if (target.window != NULL) {
        switch (param) {
            case 1: ShowWindow(target.window, SW_MAXIMIZE); break;
            case 0: ShowWindow(target.window, SW_RESTORE); break;
        }
        return 1;
    }

    return 0;
}

extern "C" BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved) {
    return TRUE;
}
