





import Proving.USC.T18.Ch75.Ontology.Statute
import Proving.USC.T18.Ch75.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch75.Ontology

open Proving.USC.Common


theorem passportMembership_intro {p c}
    (hP : IsPassport p c) (hA : IssuedUnderUSAuthority p c)
    : PassportMembership p c := ⟨hP, hA⟩


theorem instrumentPurportingMembership_intro {p c}
    (h : IsInstrumentPurportingToBePassport p c)
    : InstrumentPurportingMembership p c := ⟨h⟩


theorem entryDocumentMembership_intro {d c}
    (hPre : PrescribedByStatuteOrRegulation d c) (hPur : ForEntryStayOrEmployment d c)
    : EntryDocumentMembership d c := ⟨hPre, hPur⟩


theorem entryDocumentClass_visa_intro {c} (v : Visa) (h : IsVisa v c)
    : EntryDocumentClass c := .visa v h


theorem entryDocumentClass_other_intro {c} (d : EntryDocument) (h : IsEntryDocument d c)
    : EntryDocumentClass c := .other d h

end Proving.USC.T18.Ch75.Ontology
