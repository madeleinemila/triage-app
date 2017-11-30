PgSearch.multisearch_options = {
  :using => {
    :tsearch => {
      :prefix => true,
      :dictionary => "english" # for stemming
    },
    :trigram => {threshold:  0.1} # lower number = more results
  }
}
