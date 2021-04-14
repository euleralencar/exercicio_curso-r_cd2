install.packages('extrafont')
library(extrafont)

font_import()
# This tries to autodetect the directory containing the TrueType fonts.
# If it fails on your system, please let me know.

# Vector of font family names
fonts()

# Show entire table
fonttable()

# Register fonts for Windows bitmap output
loadfonts(device="win")


# Fonte: https://www.r-bloggers.com/2016/04/map-of-the-windows-fonts-registered-with-r/