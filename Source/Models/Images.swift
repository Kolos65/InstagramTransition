//
//  Images.swift
//  InstagramTransition
//
//  Created by Kolos Foltanyi on 2023. 07. 22..
//

import Foundation

enum Images {
    static var random: URL {
        URL(string: "https://picsum.photos/800")!
    }

    static var urls: [URL] {
        urlStrings.compactMap(URL.init)
    }

    static let urlStrings = [
        "https://fastly.picsum.photos/id/570/800/1000.jpg?hmac=vfhBWlBeXXhoPuO-NleYvutB0SYniWVW3OjNIycL2ww",
        "https://fastly.picsum.photos/id/974/800/1000.jpg?hmac=kptcz7Si19Po-Tre97QI37_Y4o_d8sA8ZGqKU1OfWWw",
        "https://fastly.picsum.photos/id/189/800/1000.jpg?hmac=w2scqQ-OZ7pEPPtNu2PCPU8Ln9KKTn-Ap9DHmqiLir0",
        "https://fastly.picsum.photos/id/998/800/1000.jpg?hmac=FS19Sscglk9d9XHyek3Gcf1kHtogXgnsADqHckOWY5Y",
        "https://fastly.picsum.photos/id/526/800/1000.jpg?hmac=LkQvpvoWXRIYmkhqx_c8jseWydQ6BXkz4i0qxrR7uEA",
        "https://fastly.picsum.photos/id/312/800/1000.jpg?hmac=JTxmRJ1rzfYc9dze7-Q8gXgCp5UFXBbpTqC_WZVMt7o",
        "https://fastly.picsum.photos/id/1035/800/1000.jpg?hmac=8ToaaM44U5AsivEpmEAXXiVeOHJlUS6HhQ4Gm73AUdU",
        "https://fastly.picsum.photos/id/805/800/1000.jpg?hmac=c9O_b1SGS1mbCzyr3CZYz9D20qhBcqooOtazZ8R6MVg",
        "https://fastly.picsum.photos/id/221/800/1000.jpg?hmac=ICWaxOPRvYufHqQ4MwrlGGJifOJMsCil-wyHrTJOJzw",
        "https://fastly.picsum.photos/id/630/800/1000.jpg?hmac=LwU-IIJKDX2wGCcUjRqZTSjwSxrzJw19HVJNpwS4hyQ",
        "https://fastly.picsum.photos/id/373/800/1000.jpg?hmac=UQO9J1HbsjnIpjC4ZCPcrt0Hgdrgnalp-DYs2paLw-g",
        "https://fastly.picsum.photos/id/276/800/1000.jpg?hmac=8jX3QAdcSR0hVNvafRyJbrBQVR8xRbqzppoXnANeks8",
        "https://fastly.picsum.photos/id/250/800/1000.jpg?hmac=XQaWXvYL1-3KNCkkYfZ3DvHGREEzkXVdpgGT97dgYL8",
        "https://fastly.picsum.photos/id/19/800/1000.jpg?hmac=YdmytzLzRbvK1oIe6-WGryIHkmJ8haVOeAtqmSDbe1I",
        "https://fastly.picsum.photos/id/1039/800/1000.jpg?hmac=cVh3_reUKEbt7N2uLW8vrjWT4slFAMasGqMuGA1OW60",
        "https://fastly.picsum.photos/id/999/800/1000.jpg?hmac=oGquAk1kbDm7QWTBv6dtDKRbLY1ht7BYrBUYr6KCUTs",
        "https://fastly.picsum.photos/id/1070/800/1000.jpg?hmac=WT7CtHbAVkdCXEMCay3YWcU-X09t57LwDEJ3wkWqcjI",
        "https://fastly.picsum.photos/id/618/800/1000.jpg?hmac=rUKyg94q-9bRp3H6_nECkQ6gQo87ca-KNyIkIthpKTE",
        "https://fastly.picsum.photos/id/221/800/1000.jpg?hmac=ICWaxOPRvYufHqQ4MwrlGGJifOJMsCil-wyHrTJOJzw",
        "https://fastly.picsum.photos/id/419/800/1000.jpg?hmac=8Oddvi08zr6iMYc9dh6k0h0Re7o1SlhmBrxsvdD4MiQ",
        "https://fastly.picsum.photos/id/7/800/1000.jpg?hmac=7Jdlq31voJNThZijq7EOFyTYNv6hlC8i_BPF4IY-Q6k",
        "https://fastly.picsum.photos/id/36/800/1000.jpg?hmac=6GPU0A5tLS1BAE7QNaLb9Irr0ZVWIoPeDrlJpOrnsjU",
        "https://fastly.picsum.photos/id/42/800/1000.jpg?hmac=fLcG4HfA-IbLvpPap_vz4FrQ2PNRXvqo4QZk26Np3i0",
        "https://fastly.picsum.photos/id/641/800/1000.jpg?hmac=dPsRwfCpe1kquKMtKbP_vo8k8IEbZVRBdKTbfG1Vk8Y",
        "https://fastly.picsum.photos/id/520/800/1000.jpg?hmac=jzDfbCm4ef38qPuvbbocXxp_LhRyUi1ZR2Uo3lfSgy4",
        "https://fastly.picsum.photos/id/943/800/1000.jpg?hmac=6EDi6ciCgow-lycYD48WpNIK4YcI6-RW3nH8uHJzUU8",
        "https://fastly.picsum.photos/id/660/800/1000.jpg?hmac=aUO2tks6fGO34JF5WDstZSzTM4Ijw6JjsCyZDF_fgok",
        "https://fastly.picsum.photos/id/228/800/1000.jpg?hmac=imtTGvAtiP4fDIHKx1yw9I8N6Fjk4xkSLUg5iHf_1DU",
        "https://fastly.picsum.photos/id/1020/800/1000.jpg?hmac=csq0s8xuAwhNTWK5717KTOs4aJMMX6ZuItAr2-MUf7Q",
        "https://fastly.picsum.photos/id/490/800/1000.jpg?hmac=VNqkfyLSe-8hI-H1iBOSiIOAMfo6bILgxyS3HNm3RgI",
        "https://fastly.picsum.photos/id/586/800/1000.jpg?hmac=dSJ-T1I6DE9muksJyCkfYhFGZVUfp9qLiDMFusc1R_s",
        "https://fastly.picsum.photos/id/21/800/1000.jpg?hmac=nAtMBIvHPlMNOwaii8rFEHIFHearD-9sfXS9toF4w8s",
        "https://fastly.picsum.photos/id/787/800/1000.jpg?hmac=jfvF31vl0Govh2uTI7qPamAASPRGKMAkweTowH2hpJw",
        "https://fastly.picsum.photos/id/9/800/1000.jpg?hmac=u_qGwSVNYHVIreeW1xlhVfF8efKcSli-3GyO0Vbw6wo",
        "https://fastly.picsum.photos/id/71/800/1000.jpg?hmac=-2KVm68f86d5FMHLyXbmgi2bFR_zGilwb9x_eLkJPsg",
        "https://fastly.picsum.photos/id/154/800/1000.jpg?hmac=37gOmfHxKlvXnF_O5R24-V8EVrQZLnQmZ_VK5sRooUQ",
        "https://fastly.picsum.photos/id/276/800/1000.jpg?hmac=8jX3QAdcSR0hVNvafRyJbrBQVR8xRbqzppoXnANeks8",
        "https://fastly.picsum.photos/id/844/800/1000.jpg?hmac=xYY1xfwVc4PExWK0Q13bz9ijewjje1rLwoydeB6T9CM",
        "https://fastly.picsum.photos/id/511/800/1000.jpg?hmac=5NZ64iBiFvjxxofSLDjFBqMeP8HPLxQDJ1Weq0BpNW8",
        "https://fastly.picsum.photos/id/363/800/1000.jpg?hmac=oZf3wNWaP_7hnZ8uj_4o2JKm1lQ0BnezJrihGodDCNQ",
        "https://fastly.picsum.photos/id/109/800/1000.jpg?hmac=goh79UD5riJ-SB0I2sPt4ux4ps-tb9-M-F9nzoL8TQU",
        "https://fastly.picsum.photos/id/227/800/1000.jpg?hmac=Nnxxgd2WnabqIsmkWxbvzurEIQVILMdoKDkybPzwLvA",
        "https://fastly.picsum.photos/id/984/800/1000.jpg?hmac=6894cwNjlHvaEEjkGeSnXd5745_9rJYR-Z5SIVu2sX8",
        "https://fastly.picsum.photos/id/562/800/1000.jpg?hmac=Wqyyfz9N6fOFcu5azh8dU9-n1_ugVPDXEwXyJpnL6g4",
        "https://fastly.picsum.photos/id/676/800/1000.jpg?hmac=FdzTxssVSRenjUNluUT-QaPw9yAhND5jgHX8OAIEsfI",
        "https://fastly.picsum.photos/id/104/800/1000.jpg?hmac=asAmeT8burLL_pt0MeihRXwViuxmX200lX7tUu54vJU",
        "https://fastly.picsum.photos/id/172/800/1000.jpg?hmac=i3BLlQ27p7R2OpcKlSR19f65MDAlA_kOUM-WxF7B8o8",
        "https://fastly.picsum.photos/id/375/800/1000.jpg?hmac=AXY0mxozda9moqR_CC6dPTQC-7LXLe6lLagErdEHhrg",
        "https://fastly.picsum.photos/id/951/800/1000.jpg?hmac=w-TbP4tF1KyFCQSvAjHioHexRO8KkDhD8wkMi48SY-k",
        "https://fastly.picsum.photos/id/137/800/1000.jpg?hmac=rSSV_6VYjvzgKMeCpyxN0S6SOXL5fILpfesBDORe1Fs",
        "https://fastly.picsum.photos/id/723/800/1000.jpg?hmac=A28cU-xmjbpmXlx4oe6Rp4krDWL6WscnYV0t9TOlg5E",
        "https://fastly.picsum.photos/id/840/800/1000.jpg?hmac=xjOrR8KdaBWnG1_k8XdwGGX0IcNpP-_ecSnjroLJHHU",
        "https://fastly.picsum.photos/id/833/800/1000.jpg?hmac=cvDaER-55Z4M1SO0pvbSPrdjlwplqexjYSE5KdUynfY",
        "https://fastly.picsum.photos/id/682/800/1000.jpg?hmac=yjOTb-nCqqaWuac41z28HBVPcVmneupMPeNmbMCFSTQ",
        "https://fastly.picsum.photos/id/106/800/1000.jpg?hmac=KkBX1hna17YKa3btDCqJRNrBZhD69_FXa7XfGcv5R54",
        "https://fastly.picsum.photos/id/878/800/1000.jpg?hmac=ICqHL7UrxPJagqbmj1EcNQ3tZy0mBVVyjOYV-U6mcuI",
        "https://fastly.picsum.photos/id/33/800/1000.jpg?hmac=VcG_0jr9IdWQkF6VPpoFUN98pZ4rfTTZbAfUQFRvWPc",
        "https://fastly.picsum.photos/id/548/800/1000.jpg?hmac=Hl8FO87CS7BIMUIzUmGDAvEUXgdRUASbXce-ND7Oa8o",
        "https://fastly.picsum.photos/id/1081/800/1000.jpg?hmac=krmYHd3b91IWWdq6JaK4xbh4DGxceTo3OR2weTKJeuE",
        "https://fastly.picsum.photos/id/543/800/1000.jpg?hmac=xqzs8uhq7ZkVy2PYwZNDBAk0HYMCkT670_1nTOtICJY",
        "https://fastly.picsum.photos/id/157/800/1000.jpg?hmac=DL3laWl3dH6UJlFHg4eGcaHIOhci1h3rqiv78BmAYe0",
        "https://fastly.picsum.photos/id/78/800/1000.jpg?hmac=8DbKeDR2YP93Q9ZdhAP4r1K2Jtye7rpBLnEvPITSsoM",
        "https://fastly.picsum.photos/id/694/800/1000.jpg?hmac=AQFztpycWEFGE4-rgvlOEx7o8CZN1yqaFqnC0qVchMM",
        "https://fastly.picsum.photos/id/244/800/1000.jpg?hmac=o-enaRlrEiIgKVsL2aC3ec16D78RIfoXZv3gJLFkKII",
        "https://fastly.picsum.photos/id/787/800/1000.jpg?hmac=jfvF31vl0Govh2uTI7qPamAASPRGKMAkweTowH2hpJw",
        "https://fastly.picsum.photos/id/1003/800/1000.jpg?hmac=hsnKqfX2Q7hrCaQYAIsipUfSJvOBdPoT7FiywHKFMQM",
        "https://fastly.picsum.photos/id/513/800/1000.jpg?hmac=MlzJAS4oHKTTTpYVKUixaOPMUzLgKkIxQpZ6QolNNY0",
        "https://fastly.picsum.photos/id/20/800/1000.jpg?hmac=2dUVyQhuDqS2mkD0NQvgz8TO-2Zgh8I37jG9lcaJQzo",
        "https://fastly.picsum.photos/id/1082/800/1000.jpg?hmac=grkRiO_vtid_bZE3zGmzRSUdCOoGR2Z1lDVx5rlKhvQ",
        "https://fastly.picsum.photos/id/730/800/1000.jpg?hmac=inoigUQsryDqG7lO1CAAQBT6lTdX03ROptpGawQ_KXI",
        "https://fastly.picsum.photos/id/700/800/1000.jpg?hmac=gF3N-5R49TukcJ6tcFH-5r1b2D7HeNa8bHUJo5m0tY0",
        "https://fastly.picsum.photos/id/772/800/1000.jpg?hmac=Flto6SVw50PZVvxSGfQtZzTJfPWif40F2VzhJ_VUXsM",
        "https://fastly.picsum.photos/id/588/800/1000.jpg?hmac=-mlVZNn-gtw7jIapk4QPw3eOe0l3_rmpp9xLvAalTqY",
        "https://fastly.picsum.photos/id/487/800/1000.jpg?hmac=aTcHwVDG5218shOs-KgbJ99DXi45c7AkzprusDkSo7U",
        "https://fastly.picsum.photos/id/794/800/1000.jpg?hmac=pcAzgJCJdj9KuAMzu3D7WcuXQP0pbQG24Spp3tZ9NX4",
        "https://fastly.picsum.photos/id/21/800/1000.jpg?hmac=nAtMBIvHPlMNOwaii8rFEHIFHearD-9sfXS9toF4w8s",
        "https://fastly.picsum.photos/id/32/800/1000.jpg?hmac=vWiw3Rzd81zHyjPDKg3njE04Eu69sa79Jz48plASX68",
        "https://fastly.picsum.photos/id/114/800/1000.jpg?hmac=R6wVg8caNVQvnOrM7TpiAipbdUrZfB2SRUibfyOeA_0",
        "https://fastly.picsum.photos/id/800/800/1000.jpg?hmac=I5G9tZjBxy6vTkzVXYeETi8lTK_s2MlfqYVqVdlGJ6o",
        "https://fastly.picsum.photos/id/926/800/1000.jpg?hmac=-zc0oI2u2xCtR4QkbONxGqco8t3sWGr82phpSOoWfn0",
        "https://fastly.picsum.photos/id/104/800/1000.jpg?hmac=asAmeT8burLL_pt0MeihRXwViuxmX200lX7tUu54vJU",
        "https://fastly.picsum.photos/id/821/800/1000.jpg?hmac=O-w921hOssU2SBMePAkcKgefotTVCkHtJSfUkbnjjkc",
        "https://fastly.picsum.photos/id/973/800/1000.jpg?hmac=NRi1oDPEB-a0GJfm8lQZUjYt9N2qptU0LfHbxkLwGcM",
        "https://fastly.picsum.photos/id/198/800/1000.jpg?hmac=_MIEGcEn1mFosoQ_a9N3sKPEpd6ppCnwiA9PnsKjTsU",
        "https://fastly.picsum.photos/id/611/800/1000.jpg?hmac=Y4ym5n8yi_-ZpFb2OBHBu6KWEdihHqSh2ZoM0_T-ryA",
        "https://fastly.picsum.photos/id/162/800/1000.jpg?hmac=ri1gJGJks3B_RPT_vi5JfepxaicBcE_NxjkAPUyGESM",
        "https://fastly.picsum.photos/id/1067/800/1000.jpg?hmac=uPQ0aUe7jLvrYGFc5cZTrcQo6-1Ww_3qCx6Uh0NGiog",
        "https://fastly.picsum.photos/id/525/800/1000.jpg?hmac=etdmC7AyER_i_bZK4amXeR8wO0neKOnj5PCVT0T1hVA",
        "https://fastly.picsum.photos/id/411/800/1000.jpg?hmac=StoYUsYvzvXLCKvXcEfoZRTmDiCmxbSlGsSW8eZzjmo",
        "https://fastly.picsum.photos/id/507/800/1000.jpg?hmac=JqdCDPZZztSGQwXL7q_KhpdJChIZttpmLWno_e_Eh48",
        "https://fastly.picsum.photos/id/886/800/1000.jpg?hmac=WUtlYtoQcgxNZPbWBbdyyiIdBTkv5FK33zJE3smWnBw",
        "https://fastly.picsum.photos/id/975/800/1000.jpg?hmac=Y5OML17BlaxC4HnJ5VSCITORNFqRrpwWV5ixCzxgfZA",
        "https://fastly.picsum.photos/id/995/800/1000.jpg?hmac=LMnuU8JSUyPe_kfg1z62HD2cO9MvyzIsHHxIbS0qSAg",
        "https://fastly.picsum.photos/id/193/800/1000.jpg?hmac=z5Bc8udHYu6GNr8aoh2-ovJShdOijye0E59kPGWsic0",
        "https://fastly.picsum.photos/id/241/800/1000.jpg?hmac=YPV-6vPF0Vj1AO_wXylGJkSR_9nhjs2018tvMQTPgzk",
        "https://fastly.picsum.photos/id/981/800/1000.jpg?hmac=McXcSey-9UIXCvwaO3c8rqbgsxoHwAtVJH65aZzaU7k",
        "https://fastly.picsum.photos/id/1048/800/1000.jpg?hmac=J6x643AbxN7OHnZ7ZaE4YSSNSrU9MsL-EIMgK1B2Ob0",
        "https://fastly.picsum.photos/id/161/800/1000.jpg?hmac=qHzKLA-EkNFiXi3MysUez2By3wAeYEf213KAxdjJZLg",
        "https://fastly.picsum.photos/id/206/800/1000.jpg?hmac=AMwmRgwF1HuNnthJxj0Eq7_ED_X_dKZYeD43QqG_P4c]"
    ]
}