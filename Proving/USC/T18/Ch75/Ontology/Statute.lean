







import Proving.USC.T18.Ch75.Ontology.Predicates
import Proving.USC.T18.Ch75.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch75.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_visa_dependsOn_entryDocument : DefEdge :=
  { defined := "visa", dependsOn := "entry document", citeDefine := "18 USC § 1546(a)" }


def edge_permit_dependsOn_entryDocument : DefEdge :=
  { defined := "permit", dependsOn := "entry document", citeDefine := "18 USC § 1546(a)" }


def edge_borderCrossingCard_dependsOn_entryDocument : DefEdge :=
  { defined := "border crossing card", dependsOn := "entry document", citeDefine := "18 USC § 1546(a)" }


def edge_alienRegistrationReceiptCard_dependsOn_entryDocument : DefEdge :=
  { defined := "alien registration receipt card", dependsOn := "entry document", citeDefine := "18 USC § 1546(a)" }


def edge_instrumentPurporting_dependsOn_passport : DefEdge :=
  { defined := "instrument purporting to be a passport", dependsOn := "passport", citeDefine := "18 USC § 1543" }


def edge_passportApplication_dependsOn_passport : DefEdge :=
  { defined := "application for passport", dependsOn := "passport", citeDefine := "18 USC § 1542" }



structure PassportMembership (p : Passport) (c : ComplaintText) : Prop where
  isPassport : IsPassport p c
  authority  : IssuedUnderUSAuthority p c



structure InstrumentPurportingMembership (p : Passport) (c : ComplaintText) : Prop where
  purports : IsInstrumentPurportingToBePassport p c



structure EntryDocumentMembership (d : EntryDocument) (c : ComplaintText) : Prop where
  prescribed : PrescribedByStatuteOrRegulation d c
  purpose    : ForEntryStayOrEmployment d c




inductive EntryDocumentClass (c : ComplaintText) : Prop where
  | visa              (v : Visa)                         : IsVisa v c → EntryDocumentClass c
  | permit            (p : Permit)                       : IsPermit p c → EntryDocumentClass c
  | borderCrossing    (b : BorderCrossingCard)          : IsBorderCrossingCard b c → EntryDocumentClass c
  | alienRegistration (a : AlienRegistrationReceiptCard) : IsAlienRegistrationReceiptCard a c → EntryDocumentClass c
  | other             (d : EntryDocument)                : IsEntryDocument d c → EntryDocumentClass c

end Proving.USC.T18.Ch75.Ontology
