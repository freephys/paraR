#!/usr/bin/env Rscript
 
hello.world <- function(i) {
   sprintf('Hello from loop iteration %d running on rank %d on node %s',
       i, Sys.getpid(), Sys.info()[c("nodename")]);
}
 
library(foreach)
library(doMC)
registerDoMC(16)
 
output.lines <- foreach(i = (1:128)) %dopar% {
   hello.world(i)
}
cat(unlist(output.lines), sep='\n')
