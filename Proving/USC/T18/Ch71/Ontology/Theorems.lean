






import Proving.USC.T18.Ch71.Ontology.Statute

namespace Proving.USC.T18.Ch71.Ontology

open Proving.USC.Common



theorem indecentByCrimeIncitement_intro {m c}
    (hCrime : IsCrimeIncitingMatter m c) (hInd : IsIndecent m c) :
    IndecentByCrimeIncitement m c :=
  ⟨hCrime, hInd⟩



theorem obsceneMatterInCommerce_intro {m c}
    (hObs : IsObsceneMatter m c) (hCom : IsInInterstateOrForeignCommerce m c) :
    ObsceneMatterInCommerce m c :=
  ⟨hObs, hCom⟩


theorem interactiveComputerServiceMembership_intro {s c}
    (h : IsInteractiveComputerService s c) :
    InteractiveComputerServiceMembership s c :=
  ⟨h⟩


theorem section1462Matter_ofObscene {m c}
    (h : IsObsceneMatter m c) : Section1462Matter m c :=
  .obscene h


theorem section1462Matter_ofArticle {m c}
    (h : IsAbortionRelatedArticle m c) : Section1462Matter m c :=
  .article h



theorem section1462Object_intro {m c}
    (hMatter : Section1462Matter m c) (hCom : IsInInterstateOrForeignCommerce m c) :
    Section1462Object m c :=
  ⟨hMatter, hCom⟩


theorem nonmailableMatterMembership_ofObscene {m c}
    (h : IsObsceneMatter m c) : NonmailableMatterMembership m c :=
  .obscene h


theorem nonmailableMatterMembership_ofAbortion {m c}
    (h : IsAbortionRelatedArticle m c) : NonmailableMatterMembership m c :=
  .abortion h


theorem nonmailableMatterMembership_ofIndecent {m c}
    (h : IsIndecent m c) : NonmailableMatterMembership m c :=
  .indecent h

end Proving.USC.T18.Ch71.Ontology
