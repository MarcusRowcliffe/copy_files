require(tidyverse)

copy_files <- function(from, to, fsep = .Platform$file.sep){
  path_lst <- strsplit(from, fsep)
  nn <- unlist(lapply(path_lst, length))
  path_df <- data.frame(id = rep(1:length(path_lst), nn),
                        value = unlist(path_lst), 
                        name = sequence(nn)) %>%
    tidyr::pivot_wider(id_cols = id) %>%
    select(-id)
  matched <- apply(path_df, 2, function(x) length(unique(x)) == 1) %>%
    which()
  path_tail <- unlist(lapply(path_lst, function(x) 
    paste(x[-matched], collapse = fsep)))
  path_to <- file.path(to, path_tail)
  dc_flag <- sapply(unique(dirname(path_to)), dir.create, recursive=TRUE)
  fc_flag <- file.copy(from, path_to, copy.date = T, copy.mode=T)
  if(any(!fc_flag))
    for(i in which(!fc_flag)) warning(paste(path_to[i], "could not be copied"))
}
