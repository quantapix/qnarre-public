









import Proving.USC.T18.Ch71.Reslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Ontology

open Proving.USC.Common


theorem section1462Object_expressive_intro {c : ComplaintText}
    (m : ObsceneMatter) (h : IsObsceneMatter m c) : Section1462Object c :=
  .expressiveObscene m h


theorem section1462Object_indecentArticle_intro {c : ComplaintText}
    (a : IndecentArticle) (h : IsIndecentArticle a c) : Section1462Object c :=
  .indecentArticle a h



theorem section1462Matter_intro {c : ComplaintText}
    (object : Section1462Object c)
    (channelInCommerce :
      ∃ e : Entity,
        (IsCommonCarrier e c ∨ IsInteractiveComputerService e c)
          ∧ InInterstateOrForeignCommerce e c)
    : Section1462Matter c :=
  ⟨object, channelInCommerce⟩



theorem section1465Matter_intro {m : ObsceneMatter} {c : ComplaintText}
    (object : IsObsceneMatter m c)
    (channelInCommerce :
      ∃ e : Entity,
        InInterstateOrForeignCommerce e c ∨ IsInteractiveComputerService e c)
    : Section1465Matter m c :=
  ⟨object, channelInCommerce⟩

end Proving.USC.T18.Ch71.Reslice.Ontology
