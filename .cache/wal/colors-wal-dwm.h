static const char norm_fg[] = "#a6bcc1";
static const char norm_bg[] = "#0a0c12";
static const char norm_border[] = "#748387";

static const char sel_fg[] = "#a6bcc1";
static const char sel_bg[] = "#31554F";
static const char sel_border[] = "#a6bcc1";

static const char urg_fg[] = "#a6bcc1";
static const char urg_bg[] = "#533142";
static const char urg_border[] = "#533142";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
