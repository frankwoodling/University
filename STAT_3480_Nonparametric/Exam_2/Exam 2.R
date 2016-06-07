a <- read.table('State+Test+Data.txt', header = T, sep = "")
nrow = 11
b <- read.table('Internal+Research+-+WCtY+Time+Data.txt', header = T)

a
head(a)
head(b)

a <- data('cloudseeding.txt', header = T)
help(read.table)
# two major tests to test two major concerns
# test scale and variance, RMD
# one of the assumptions to do a wilcoxon is that we have near equal variance
# must do RMD test first

# siegel-tukey model assumes known means and we do not know the means
# check summary statistics (make sure this is done)
# Q-Q plots, boxplots as well

# intro nice general explanation of what you are about to to do and answer why non-parametric instead of t-test
# summary of data is qq plots, box plots, summary statistics
# test is not implemented in the third section of report
# apply the test in part 4, this is where you get pvalues and test statistics
# just state the results
# in part 5 you describe those results in context
# for conclusion you can restate some discussion
# for code appendix

# he likes tables, put * for significant result
# submit as pdf