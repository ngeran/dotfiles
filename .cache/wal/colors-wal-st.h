const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0c12", /* black   */
  [1] = "#533142", /* red     */
  [2] = "#31554F", /* green   */
  [3] = "#5A5B5A", /* yellow  */
  [4] = "#B05255", /* blue    */
  [5] = "#38A65C", /* magenta */
  [6] = "#B2A54C", /* cyan    */
  [7] = "#a6bcc1", /* white   */

  /* 8 bright colors */
  [8]  = "#748387",  /* black   */
  [9]  = "#533142",  /* red     */
  [10] = "#31554F", /* green   */
  [11] = "#5A5B5A", /* yellow  */
  [12] = "#B05255", /* blue    */
  [13] = "#38A65C", /* magenta */
  [14] = "#B2A54C", /* cyan    */
  [15] = "#a6bcc1", /* white   */

  /* special colors */
  [256] = "#0a0c12", /* background */
  [257] = "#a6bcc1", /* foreground */
  [258] = "#a6bcc1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
