import db as db
from oliot import Tiketti
from oliot import Tyontekija

def display_menu():
    print("\n")
    print("PIISPAN HELDESK (KÄYTTÄJÄ)")
    print()
    print("KOMENTOVALIKKO")
    print("-" * 105)
    print("katso - Katso kaikki tiketit")
    print("asia - Katso asia")
    print("lisaa - Lisää tiketti")
    print("paivita - Päivitä tiketti")
    print("exit - Poistu ohjlemasta")
    print("-" * 105)
    
def katso_tiketit():
    print("")
    print("HELDESK PIISPAN TIKETIT") 
    print("-" * 145)
    line_format = "{:5s} {:20s} {:30s} {:20s} {:30s} {:20s} {:20s}"
    print(line_format.format("ID", "Nimi", "Sähköposti", "Päivämäärä", "Työntekijä", "Ratkaisu", "Status"))
    print("-" * 145)
    tiketit = db.hae_tiketit()
    for tiketti in tiketit:
        print(line_format.format(str(tiketti.tikettiID), tiketti.asiakasnimi, tiketti.asiakassposti, str(tiketti.kirjauspaiva), tiketti.nimi, tiketti.ratkaisu, tiketti.status))
        print("-" * 145)

        
def lisaa_tiketti():
    statusID          = int(input("Anna status (1=Avoin, 2=Työn alla, 3=Suljettu): "))
    ratkaisuID        = int(input("Anna ratkaisu (1=Mahdollinen, 2=Muunneltava, 3=Säilytettävä): "))
    katso_tyontekijat()
    nimi              = int(input("Anna tyontekijaID: "))
    asia              = input("Kerro asia: ")
    asiakasnimi       = input("Anna asiakkaan nimi: ")
    asiakassposti     = input("Anna asiakkaan sposti: ")

    tiketti = Tiketti(statusID=statusID, ratkaisuID=ratkaisuID, tyontekijaID=nimi, asia=asia, asiakasnimi=asiakasnimi, asiakassposti=asiakassposti)
    
    db.lisaa_tiketti(tiketti)
    print(asiakasnimi + " on lisätty tietokantaan onnistuneesti! \n ")
    
def paivita_tiketti():
    tikettiID       = int(input("Anna tiketti ID: "))
    valinta         = input("Oletko varma? (k/e): ")
    if (valinta == "k"):
        statusID        = int(input("Anna status ID (1=Avoin, 2=Työn alla, 3=Suljettu): "))
        db.paivita_tiketti(tikettiID, statusID)
        print("päivitetty onnistuneesti\n")
    else:
        print("ei päivitetty\n")
        
def katso_asiaa():
    tikettiID = int(input("Anna tiketti ID: "))
    tiketti = db.katso_asiaa(tikettiID)
    print("")
    print("HELDESK PIISPAN TIKETIT\n") 
    print("-" * 135)
    line_format = "{:5s} {:100s}"
    print(line_format.format("ID", "ASIA"))
    print("-" * 135)
    print(line_format.format(str(tiketti.tikettiID), tiketti.asia))
    print("-" * 135)
        
def katso_tyontekijat():
    print("")
    print("HELDESK PIISPAN TYÖNTEKIJÄT") 
    print("-" * 105)
    line_format = "{:5s} {:20s} {:15s}"
    print(line_format.format("ID", "Nimi", "Rooli"))
    print("-" * 105)
    tyontekijat = db.hae_tyontekijat()
    for tyontekija in tyontekijat:
        print(line_format.format(str(tyontekija.tyontekijaID), tyontekija.nimi, tyontekija.rooli))
        print("-" * 105)

    
    
    
def main():
    db.connect()
    
    while True:
        print("\n")
        print("PIISPAN HELPDESKIN KIRJAUTUMINEN")
        print("-" * 55)
        tunnus = input("TUNNUS: ")
        salasana = input("SALASANA: ")
        if db.login(tunnus, salasana):
          break
        else:
            print("\nKirjautuminen epäonnistui, yritä uudelleen.\n")
    
    display_menu()
    
    while True:
        komento = input("Anna komento: ")
        if komento == "katso":
            katso_tiketit()
        elif komento == "asia":
            katso_asiaa()
        elif komento == "lisaa":
            lisaa_tiketti()
        elif komento == "paivita":
            paivita_tiketti() 
        elif komento == "exit":
            break
        else:
            print("Komento on väärä, yritä uudelleen \n")
            display_menu()
            
    db.close()
    print("Ohjelma lopetettu")
    
if __name__ == "__main__":
    main()