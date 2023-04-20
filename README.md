# dunnetgent

<!-- badges: start -->
![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
<!-- badges: end -->

Khi2 test of Dunnet &amp; Gent for non-inferiority models

based on Dunnett, C.W. and Gent, M. (1977) Significance Testing to Establish Equivalence between Treatments, with Special Reference to Data in the Form of 2 × 2 Tables.

Biometrics, 33, 593-602.

http://dx.doi.org/10.2307/2529457

## Functions

### dunnettgent

test of khi2 modified for non-inferiority studies.

```r
> df <- dplyr::tibble(trait = c("a","b","a"), alive = c("yes", "yes", "no"))

> dunnettgent(dfx = df, vin = trait, vout = alive, success = "yes", delta = 0.1, corcont = TRUE)

$khi2
[1] 0.065

$p.value
[1] "p = 0.798"
```

### beaup

write a beautifull p-value.

```r
> beaup(0.005, affp = TRUE)

[1] "p = 0.005"
```



## License

[MIT](https://choosealicense.com/licenses/mit/)
