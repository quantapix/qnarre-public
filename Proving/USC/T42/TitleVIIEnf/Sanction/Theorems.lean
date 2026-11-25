






import Proving.USC.T42.TitleVIIEnf.Sanction.Statute

namespace Proving.USC.T42.TitleVIIEnf.Sanction

open Proving.USC.Common




def sanction2000e5b_intro {c : ComplaintText}
    (fineSought : Sanction) (fineHonours : WithinRange fineSought Fine2000e5b)
    (prisonSought : Sanction)
    (prisonHonours : WithinRange prisonSought Imprisonment2000e5b)
    (offense : OffenseTriggered .DiscloseConciliationInfo c)
    (finePleaded : SanctionSought fineSought c) :
    Sanction2000e5b c :=
  ⟨fineSought, fineHonours, prisonSought, prisonHonours, offense, finePleaded⟩



def sanction2000e8e_intro {c : ComplaintText}
    (fineSought : Sanction) (fineHonours : WithinRange fineSought Fine2000e8e)
    (prisonSought : Sanction)
    (prisonHonours : WithinRange prisonSought Imprisonment2000e8e)
    (offense : OffenseTriggered .DiscloseCommissionInfo c)
    (finePleaded : SanctionSought fineSought c) :
    Sanction2000e8e c :=
  ⟨fineSought, fineHonours, prisonSought, prisonHonours, offense, finePleaded⟩



theorem noSanction2000e12b_intro {c : ComplaintText}
    (barEstablished : GoodFaithRelianceBar c) :
    NoSanction2000e12b c :=
  ⟨barEstablished⟩

end Proving.USC.T42.TitleVIIEnf.Sanction
