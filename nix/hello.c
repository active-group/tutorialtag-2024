#include <ncurses.h>
#include <stdlib.h>
#include <string.h>

int main() {
    WINDOW *win = initscr();
    start_color();
    init_pair(1, COLOR_BLACK, COLOR_GREEN);
    wbkgd(win, COLOR_PAIR(1));
    box(win, 0, 0);
    curs_set(0);

    int center = win->_maxx / 2;
    const char text[] = "HALLO TUTORIALTAG";
    int x = center - strlen(text) / 2;
    int y = win->_maxy / 2;
    mvwprintw(win, y, x, "%s", text);
    wrefresh(win);

    getch();

    delwin(win);
    endwin();
    refresh();
    return EXIT_SUCCESS;
}
