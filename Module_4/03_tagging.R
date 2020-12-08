# Packages-----------------------------------------------------------------
library(ggplot2)
library(udpipe)
library(textrank)
library(dplyr)
library(forcats)

#Downloading the model -----------------------------------------------------------------
ud_model <- udpipe_download_model(language = "portuguese")
ud_model <- udpipe_load_model(ud_model$file_model)

# Loading the interviews -----------------------------------------------------------------
load('./data/02_scrape_html.RData')

#Tagging and saving in a new data frame -----------------------------------------------------------------
Tagged.Interviews <- udpipe_annotate(ud_model,  
                          x=base$Text, 
                          doc_id = base$Title) %>% as.data.frame()

# Analysing the most frequent verbs -----------------------------------------------------------------

Verbs <- subset(Tagged.Interviews, upos %in% c("VERB")) 
Verbs  <- txt_freq(Verbs$lemma)
Verbs.top <- Verbs[1:25,]

# Plotting -----------------------------------------------------------------

Verbs.top%>%
  mutate(key = fct_reorder(key, freq_pct)) %>%
  ggplot(., aes(x = key, y = freq_pct, fill=key)) +
  geom_segment(aes(x=key, xend=key, y=0, yend=freq_pct), color="black",size = 2) +
  geom_point(shape = 21, color="black", fill ='#FF0000', size=14, stroke = 1) +
  theme_light() +
  labs(caption="Fonte: Dados",
       x = "Verbos",
       y = "Frequência Normalizada (100)") +
  theme(axis.text.x = element_text(angle=40, vjust=0.6),legend.position = "none",panel.grid.major.x = element_blank(),
        panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        text = element_text(size=30))

# Observing verbs+nouns -------------------------------------------------------
sub_verb <- keywords_phrases(x = Tagged.Interviews$upos, term = tolower(Tagged.Interviews$token),pattern = "NOUN+VERB", is_regex = TRUE, detailed = FALSE)

# Observing nouns+adjectives -------------------------------------------------------
sub.adj <- keywords_phrases(x = Tagged.Interviews$upos, term = tolower(Tagged.Interviews$token),pattern = "NOUN+ADJ", is_regex = TRUE, detailed = FALSE)

# Analysing some collocates -------------------------------------------------------
collocates<-collocation(Tagged.Interviews, term="lemma", group="doc_id", ngram_max = 3, n_min = 2, sep = " ")

# Matrix calculation -------------------------------------------------------
x <- document_term_frequencies(Tagged.Interviews[, c("doc_id", "lemma")])
dtm <- document_term_matrix(x)
correlation<-dtm_cor(dtm)

















