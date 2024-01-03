class Tiketti:
    def __init__(self, tikettiID=0, statusID=0, ratkaisuID=0, tyontekijaID=0, asia=None, asiakasnimi=None, asiakassposti=None, nimi=None, status=None, ratkaisu=None, kirjauspaiva=None):
        self.tikettiID = tikettiID
        self.statusID = statusID
        self.ratkaisuID = ratkaisuID
        self.tyontekijaID = tyontekijaID
        self.asiakasnimi = asiakasnimi
        self.asiakassposti = asiakassposti
        self.kirjauspaiva = kirjauspaiva
        self.nimi = nimi
        self.ratkaisu = ratkaisu
        self.asia = asia
        self.status = status
        
class Tyontekija:
    def __init__(self, tyontekijaID=0, nimi=None, tunnus=None, salasana=None, sposti=None, rooliID=0, rooli=None):
        self.tyontekijaID = tyontekijaID
        self.nimi = nimi
        self.tunnus = tunnus
        self.salasana = salasana
        self.sposti = sposti
        self.rooliID = rooliID  
        self.rooli = rooli  
        

        
        
