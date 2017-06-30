;;; packages.el --- bio layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Marcio Giaxa Marinheiro <marciogiaxa@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `bio-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `bio/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `bio/pre-init-PACKAGE' and/or
;;   `bio/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst bio-packages
  '((pdb-mode :location ( recipe
                          :fetcher github
                          :repo "marciogm/emacs-pdb-mode")))
  "The list of Lisp packages required by the bio layer.")

(defun bio/init-pdb-mode ()
  (use-package pdb-mode
    :defer t
    :mode ( "\\.pdb" . pdb-mode)
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'pdb-mode
        "[" 'pdb-forward-residue
        "]" 'pdb-back-residue
        "{" 'pdb-forward-chain
        "}" 'pdb-back-chain
        "sc" 'pdb-select-chain
        "sr" 'pdb-select-residue
        "sz" 'pdb-select-zone
        "ca" 'pdb-change-alternate
        "cf" 'pdb-change-bfactor
        "cF" 'pdb-change-frac2orth
        "cc" 'pdb-change-chain
        "cm" 'pdb-change-mutate
        "co" 'pdb-change-occu
        "cO" 'pdb-change-orth2frac
        "cr" 'pdb-change-residue
        "cs" 'pdb-change-segid
        "ct" 'pdb-change-type
        "if" 'pdb-increment-bfactor
        "ic" 'pdb-increment-centroid
        "ie" 'pdb-increment-euler
        "im" 'pdb-increment-matrix
        "ir" 'pdb-increment-residue
        "ix" 'pdb-increment-xyz
        "iF" 'pdb-scale-bfactor
        "iX" 'pdb-scale-xyz
        "ra" 'pdb-renumber-atoms
        "rw" 'pdb-renumber-waters
        "ta" 'pdb-tidy-alter
        "tA" 'pdb-tidy-amino
        "tt" 'pdb-tidy-atom2hetatm
        "tc" 'pdb-tidy-ca
        "td" 'pdb-tidy-dehydrogenate
        "te" 'pdb-tidy-end
        "th" 'pdb-tidy-hetatm2atom
        "tp" 'pdb-tidy-polyalanime
        "tx" 'pdb-xyz
        "nb" 'pdb-new-base
        "nd" 'pdb-new-dnaseq
        "nh" 'pdb-new-hicup
        "np" 'pdb-new-pdb
        "nP" 'pdb-new-prodrg
        "nr" 'pdb-new-residue
        "ns" 'pdb-new-sequence
        "mv" 'pdb-view
        "md" 'pdb-data-cell
        "mD" 'pdb-data-spacegroup))
    ))
