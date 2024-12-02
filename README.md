# Koha-Suomi plugin Nalkutin

A Koha plugin to validate biblios before they're saved by the cataloguer.
Requires before_addbiblio_errors hook.


You can define in plugin's configuration which MARC fields are ignored:

![kuva](https://github.com/user-attachments/assets/7796673f-afa6-42cb-9f8a-70a6e43061df)

In TäTi these fields are ignored: 09x,046z,59x,880,9xx,xxx9,8565,579,8845,8525,0365,xxx5,036,790,653g
