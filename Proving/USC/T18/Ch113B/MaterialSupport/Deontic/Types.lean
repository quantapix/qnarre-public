import Proving.USC.Common.Types













set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Deontic



inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq, Repr



inductive ClauseId where

  | s2339a

  | s2339b

  | s2339Aa

  | s2339Ab

  | s2339Ba1

  | s2339Ba2

  | s2339Bb

  | s2339Bc

  | s2339Bd

  | s2339Be1

  | s2339Be2

  | s2339Be3Referral

  | s2339Be3Notify

  | s2339Be3Remedial

  | s2339Bf1A

  | s2339Bf1B

  | s2339Bf2B

  | s2339Bf3C

  | s2339Bf5Bii

  | s2339Bf5Biii

  | s2339Bg

  | s2339Bh

  | s2339Bi

  | s2339Bj1

  | s2339Bj2

  | s2339Ca1

  | s2339Cb

  | s2339Cc

  | s2339Cd

  | s2339Ce

  | s2339Cf

  | s2339Da

  | s2339Db

  | s2339Dc
  deriving DecidableEq, Repr


opaque Organization : Type


opaque FinancialInstitution : Type


opaque Funds : Type



opaque MaterialSupport : Type




opaque Offense : Type


opaque MilitaryTraining : Type


opaque LegalEntity : Type


opaque JudicialDistrict : Type



opaque CivilProceeding : Type



opaque ClassifiedInfoRequest : Type

end Proving.USC.T18.Ch113B.MaterialSupport.Deontic
