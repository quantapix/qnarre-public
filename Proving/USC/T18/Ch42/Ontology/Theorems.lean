





import Proving.USC.T18.Ch42.Ontology.Statute

namespace Proving.USC.T18.Ch42.Ontology
open Proving.USC.Common



theorem extortionateExtensionInhabited_intro
    {x : ExtensionOfCredit} {cr dr : Person} {c : ComplaintText}
    (hExt : IsExtensionOfCredit x c)
    (hCr  : IsCreditor cr c)
    (hDr  : IsDebtor dr c)
    (hEx  : IsExtortionateExtensionOfCredit x c)
    : ExtortionateExtensionInhabited x cr dr c :=
  ⟨hExt, hCr, hDr, hEx⟩


theorem collectionByExtortionateMeansInhabited_intro
    {x : ExtensionOfCredit} {m : Means} {c : ComplaintText}
    (hExt : IsExtensionOfCredit x c)
    (hCol : IsCollectionOfExtension x c)
    (hMns : IsExtortionateMeans m c)
    : CollectionByExtortionateMeansInhabited x m c :=
  ⟨hExt, hCol, hMns⟩

end Proving.USC.T18.Ch42.Ontology
