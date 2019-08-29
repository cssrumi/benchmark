#![crate_type = "dylib"]

use rayon::prelude::*;
use std::os::raw::c_double;

fn calc(genotype: &[c_double],
        training_data: &[&[c_double]])
        -> c_double {
    let size = genotype.len();
    let mut fitness = 0.0;
    let mut entire_fitness = 0.0;
    for td in training_data {
        for i in 0..size {
            fitness += genotype[i] * td[i];
        }
        fitness -= training_data[size];
        entire_fitness += fitness
    }
    entire_fitness
}

#[no_mangle]
pub extern fn calc_fitness<'a>(genotypes: &[&[c_double]],
                               training_data: &[&[c_double]])
                               -> &'a[c_double] {
    let size = genotypes.len();
    let mut results = [c_double, size];
    for i in 0..size {
        results[i] = calc(genotypes[i], training_data);
    }
    results
}

//#[no_mangle]
//pub extern fn pcalc_fitness(value: i32) -> i32 {
//    value * 3
//}
