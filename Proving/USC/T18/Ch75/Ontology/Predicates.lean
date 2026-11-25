







import Proving.USC.T18.Ch75.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch75.Ontology

open Proving.USC.Common



axiom IsPassport (p : Passport) (c : ComplaintText) : Prop




axiom IssuedUnderUSAuthority (p : Passport) (c : ComplaintText) : Prop



axiom IsPassportApplication (a : PassportApplication) (c : ComplaintText) : Prop




axiom IsInstrumentPurportingToBePassport (p : Passport) (c : ComplaintText) : Prop



axiom IsVisa (v : Visa) (c : ComplaintText) : Prop



axiom IsPermit (p : Permit) (c : ComplaintText) : Prop



axiom IsBorderCrossingCard (b : BorderCrossingCard) (c : ComplaintText) : Prop



axiom IsAlienRegistrationReceiptCard (a : AlienRegistrationReceiptCard) (c : ComplaintText) : Prop





axiom IsEntryDocument (d : EntryDocument) (c : ComplaintText) : Prop



axiom PrescribedByStatuteOrRegulation (d : EntryDocument) (c : ComplaintText) : Prop




axiom ForEntryStayOrEmployment (d : EntryDocument) (c : ComplaintText) : Prop



axiom IsIdentificationDocument (d : IdentificationDocument) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch75.Ontology
