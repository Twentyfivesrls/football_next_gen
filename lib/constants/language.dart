String? getCurrentLanguageValue(String field) {
  // una cosa per capire in che lingua è il telefono
  // cerca la stringa in base a quella lingua
  return LANG_IT[field];
}

const String LOGIN = "Login";
const String EMAIL = "Email";
const String PASSWORD = "Password";
const String PASSWORD_CONFIRM = "Conferma password";
const String FORGOT_PASSWORD = "Password dimenticata?";
const String ACCEDI = "Accedi";
const String DONT_HAVE_ACCOUNT = "Non hai un account?";
const String CREATE_ONE = "Creane uno";
const String OR = "oppure";
const String LOGIN_WITH_GOOGLE = "Accedi con Google";
const String LOGIN_WITH_SPID = "Entra con SPID";
const String ENTER_IN = "Entra in";
const String FOOTBALL_NEXT_GEN = "Football Next Gen";
const String REGISTER_SUBTITLE = "Indica se sei un Centro Sportivo o un Genitore per creare un nuovo account";
const String ALREDY_HAVE_ACCOUNT = "Hai già un account?";
const String SPORTS_CENTER = "Centro Sportivo";
const String PARENT = "Genitore";
const String RECOVER_PASSWORD_SUBTITLE = "Inserisci l'indirizzo email associato al tuo account e ti invieremo istruzioni su come reimpostare la tua password. Assicurati di utilizzare l'indirizzo email con cui hai registrato il tuo account.";
const String RECOVER_PASSWORD_TITLE = "Password dimenticata";
const String SEND = "Invia";
const String BACK_TO_LOGIN = "Torna alla pagina di";
const String EMAIL_SENDED = "Email inviata";
const String RECOVER_PASSWORD_CONFIRMED_SUBTITLE = "Abbiamo inviato le istruzioni per il cambio password al tuo indirizzo email. Controlla la tua casella di posta e segui i passaggi indicati per completare il processo.";
const String REGISTER = "Registrazione";
const String PARENT_DATA = "Dati Genitore";
const String CHILD_DATA = "Dati Figlio";
const String FIRSTNAME = "Nome";
const String LASTNAME = "Cognome";
const String PHONENUMBER = "Telefono";
const String CITY = "Città";
const String UPLOAD_A_DOCUMENT = "Carica un documento";
const String UPLOAD_DOCUMENT = "Carica documento";
const String UPLOAD_DOCUMENT_SUBTITLE = "Carica le immagini fronte/retro di un documento di identità valido. I formati accettati sono JPG, PNG e PDF";
const String USERNAME = "Username";
const String DATE = "Data di nascita";
const String ACCEPT = "accetto i";
const String TERMS_OF_SERVICE = "Termini e le condizioni indicate";
const String CREATE_ACCOUNT = "Crea account";
const String BACK_TO = "Torna alla";
const String ACCOUNT_CHOICE = "Scelta account";
const String SPORT_CENTER_NAME = "Nome Centro";






//old
const String SIGNUP = "Registrati";
const String CITIES_OF_INTEREST = "Città di interesse";
const String FORGOT_PASS_DESC = "Scrivi l'indirizzo email con cui ti sei registrato e ti invieremo un link di recupero";
const String RECOVER_PASSWORD = "Recupera";
const String SIGNIN = "Accedi";
const String CANCEL = "Annulla";
const String APPLY = "Applica";
const String MY_PROFILE = "Il mio profilo";
const String ADD_PHOTO = "Aggiungi foto";
const String CHANGE_PASSWORD = "Cambia password";
const String DELETE_ACCOUNT = "Elimina account";
const String DELETE_ACCOUNT_MESSAGE = "Sei sicuro di voler cancellare il tuo account?";
const String ARE_YOU_SURE_GO_BACK = "Sei sicuro di voler annullare le modifiche?";
const String ARE_YOU_SURE = "Sei sicuro?";
const String LOGOUT = "Logout";
const String TERMS_AND_CONDITION = "Termini e condizioni";
const String PRIVACY_POLICY = "Privacy policy";
const String MY_CITIES_DEMISES = "Decessi dei miei comuni";
const String SELECT_CITIES = "Seleziona i comuni di interesse";
const String ORDER_BY = "Ordina per:";
const String NO_DEMISES = "Nessun decesso trovato";
const String NO_PRODUCTS = "Nessun prodotto trovato";
const String SEARCH_DEMISES = "Cerca per cognome";
const String SEARCH_CITY = "Cerca un comune";
const String ENABLE_NOTIFICATIONS = "Abilita le notifiche";
const String NO_NOTIFICATION_FOUND = "Non hai ancora ricevuto notifiche";
const String SYNCHRONIZE_PHONE_CONTACTS = "Sincronizza rubrica";
const String OK = "Ok";
const String INSERT_PHOTO = "Tocca per caricare una foto";
const String CREATE_DEMISE = "Inserisci decesso";
const String CREATE_PRODUCT = "Inserisci prodotto";
const String SELECT_PRODUCT = "Seleziona prodotti";

const String INSERT_DEMISE = "Inserisci nuovo decesso";
const String INSERT_PRODUCT = "Inserisci nuovo prodotto";
const String RELATIVE_DETAIL = "Dati parenti";
const String DEFUNCT_PHONE = "Numero di telefono del defunto";
const String RELATIVES_DETAILS_DESC = "Il defunto è:";
const String REMOVE_RELATIVE = "Rimuovi parente";
const String ADD_RELATIVE = "Aggiungi parente";
const String DEMISE_DETAIL = "Dati defunto";
const String TAP_INSERT_PHOTO = "Tocca per caricare una foto";
const String TAP_INSERT_PDF = "Tocca per caricare un file";
const String TIME = "Orario";
const String ADDRESS = "Indirizzo";
const String WAKE_NOTES = "Note sulla veglia";
const String FUNERAL_NOTES = "Note sul funerale";
const String FUNERAL_DETAILS = "Dati funerale";
const String WAKE_DETAILS = "Dati veglia";
const String SAVE = "Salva";
const String SEARCH_RELATIVE_PHONE = "Numero del parente";
const String DEATH_DATE = "Data del decesso";
const String CONFIRM = "Conferma";
const String NO_CITY_SELECTED = "Nessun comune di interesse selezionato";
const String SELECT_CITY = "Seleziona un comune";
const String LIVING_CITY_NAME = "Nome della città di residenza";
const String PDF_DOCUMENT = "PDF Necrologio";
const String AGE = "Età";
const String AGE_NOT_SPECIFIED = "Età non specificata";
//Nomi pagine bottombar
const String MY_DEFUNCT = "I miei defunti";
const String NOTIFICATIONS = "Notifiche";
const String PROFILE = "Profilo";
const String DEMISES = "Decessi del Comune";
const String TELEPHONE_BOOK = "Rubrica";
const String PRODUCTS = "Prodotti";
const String DEFUNCT_DETAIL = "Dettaglio defunto";



final Map<String, String> LANG_IT = {
  LOGIN:"Login",
  EMAIL:"Email",
  PASSWORD:"Password",
  FORGOT_PASSWORD:"Password dimenticata?",
  ACCEDI:"Accedi",
  DONT_HAVE_ACCOUNT:"Non hai un account?",
  CREATE_ONE:"Creane uno",
  OR:"oppure",
  LOGIN_WITH_GOOGLE:"Accedi con Google",
  LOGIN_WITH_SPID:"Entra con SPID",
  ENTER_IN:"Entra in",
  FOOTBALL_NEXT_GEN:"Football Next Gen",
  REGISTER_SUBTITLE:"Indica se sei un Centro Sportivo o un Genitore per creare un nuovo account",
  ALREDY_HAVE_ACCOUNT:"Hai già un account?",
  SPORTS_CENTER:"Centro Sportivo",
  PARENT:"Genitore",
  RECOVER_PASSWORD_TITLE:"Password dimenticata",
  RECOVER_PASSWORD_SUBTITLE:"Inserisci l'indirizzo email associato al tuo account e ti invieremo istruzioni su come reimpostare la tua password. Assicurati di utilizzare l'indirizzo email con cui hai registrato il tuo account.",
  RECOVER_PASSWORD_CONFIRMED_SUBTITLE:"Abbiamo inviato le istruzioni per il cambio password al tuo indirizzo email. Controlla la tua casella di posta e segui i passaggi indicati per completare il processo.",
  SEND:"Invia",
  BACK_TO_LOGIN:"Torna alla pagina di",
  EMAIL_SENDED:"Email inviata",
  REGISTER:"Registrazione",
  PARENT_DATA:"Dati Genitore",
  CHILD_DATA:"dati Figlio",
  FIRSTNAME:"Nome",
  LASTNAME:"Cognome",
  CITY:"Città",
  PHONENUMBER:"Telefono",
  PASSWORD_CONFIRM:"Conferma password",
  UPLOAD_A_DOCUMENT:"Carica un documento",
  UPLOAD_DOCUMENT:"Carica documento",
  UPLOAD_DOCUMENT_SUBTITLE:"Carica le immagini fronte/retro di un documento di identità valido. I formati accettati sono JPG, PNG e PDF",
  USERNAME:"Username",
  DATE:"Data di nascita",
  ACCEPT:"Accetto i",
  TERMS_OF_SERVICE:"Termini e le condizioni indicate",
  CREATE_ACCOUNT:"Crea account",
  BACK_TO:"Torna alla",
  ACCOUNT_CHOICE:"Scelta account",
  SPORT_CENTER_NAME:"Nome Centro",





  //old
  FORGOT_PASS_DESC:"Scrivi l'indirizzo email con cui ti sei registrato e ti invieremo un link di recupero",
  RECOVER_PASSWORD:"Recupera",
  SIGNUP:"Registrati",
  SIGNIN:"Accedi",
  CANCEL:"Annulla",
  APPLY:"Applica",
  MY_PROFILE:"Il mio profilo",
  ADD_PHOTO:"Aggiungi foto",
  CHANGE_PASSWORD:"Cambia password",
  DELETE_ACCOUNT:"Elimina account",
  ARE_YOU_SURE:"Sei sicuro?",
  DELETE_ACCOUNT_MESSAGE:"Sei sicuro di voler cancellare il tuo account?",
  LOGOUT:"Logout",
  PRIVACY_POLICY:"Privacy policy",
  TERMS_AND_CONDITION:"Termini e condizioni",
  MY_DEFUNCT:"I miei defunti",
  NOTIFICATIONS:"Notifiche",
  PROFILE:"Profilo",
  DEMISES:"Decessi del Comune",
  TELEPHONE_BOOK:"Rubrica",
  MY_CITIES_DEMISES:"Decessi dei miei comuni",
  SELECT_CITIES:"Seleziona i comuni di interesse",
  ORDER_BY:"Ordina per:",
  NO_DEMISES:"Nessun decesso trovato",
  NO_PRODUCTS:"Nessun prodotto trovato",
  SEARCH_DEMISES:"Cerca per cognome",
  SEARCH_CITY:"Cerca un comune",
  ENABLE_NOTIFICATIONS:"Abilita le notifiche",
  NO_NOTIFICATION_FOUND:"Non hai ancora ricevuto notifiche",
  SYNCHRONIZE_PHONE_CONTACTS:"Sincronizza rubrica",
  OK:"Ok",
  INSERT_PHOTO:"Tocca per caricare una foto",
  CREATE_DEMISE:"Inserisci decesso",
  CREATE_PRODUCT:"Inserisci prodotto",
  INSERT_DEMISE:"Inserisci nuovo decesso",
  INSERT_PRODUCT:"Inserisci nuovo prodotto",
  RELATIVE_DETAIL:"Dati parenti",
  DEFUNCT_PHONE:"Numero di telefono del defunto",
  RELATIVES_DETAILS_DESC:"Il defunto è:",
  REMOVE_RELATIVE:"Rimuovi parente",
  ADD_RELATIVE:"Aggiungi parente",
  DEMISE_DETAIL:"Dati defunto",
  TAP_INSERT_PHOTO:"Tocca per caricare una foto",
  TAP_INSERT_PDF:"Tocca per caricare un file",
  TIME:"Orario",
  ADDRESS:"Indirizzo",
  WAKE_NOTES:"Note sulla veglia",
  FUNERAL_NOTES:"Note sul funerale",
  FUNERAL_DETAILS:"Dati funerale",
  WAKE_DETAILS:"Dati veglia",
  SAVE:"Salva",
  SEARCH_RELATIVE_PHONE:"Numero del parente",
  DEATH_DATE:"Data del decesso",
  CONFIRM:"Conferma",
  NO_CITY_SELECTED:"Nessun comune di interesse selezionato",
  SELECT_CITY:"Seleziona un comune",
  LIVING_CITY_NAME:"Nome della città di residenza",
  ARE_YOU_SURE_GO_BACK:"Sei sicuro di voler tornare indietro?",
  PDF_DOCUMENT:"PDF Necrologio",
  AGE:"Età",
  AGE_NOT_SPECIFIED:"Età non specificata",
  PRODUCTS:"Prodotti",
  DEFUNCT_DETAIL:"Dettaglio defunto",
  SELECT_PRODUCT:"Seleziona prodotti",
};

final Map<String, String> LANG_EN = {
  LOGIN:"Login",
  EMAIL:"Email",
  PASSWORD:"Password",
};
